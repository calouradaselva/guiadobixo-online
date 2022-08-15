import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:guiadobixo/src/pages/page.dart';
import 'package:guiadobixo/src/widgets/button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:guiadobixo/src/widgets/text.dart';
import 'package:guiadobixo/src/widgets/paragraph.dart';

class EventoCalendario {
  final int dia, mes;
  final String titulo;
  final String? descricao, url;

  EventoCalendario(
      {required this.dia,
      required this.mes,
      required this.titulo,
      this.descricao,
      this.url});
}

class ItemLista extends StatefulWidget {
  final Widget child;

  const ItemLista({super.key, required this.child});

  @override
  State<ItemLista> createState() => _ItemListaState();
}

class _ItemListaState extends State<ItemLista>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

class HomePage extends AppPage {
  const HomePage({Key? key, required title}) : super(key: key, title: title);

  static const List<String> meses = [
    "Dummy",
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro"
  ];

  List<EventoCalendario> getEventosCalendario() {
    return [
      EventoCalendario(
          dia: 21,
          mes: 4,
          titulo: "Nome do evento",
          descricao: "(OPCIONAL) breve descricao do evento",
          url: "(OPCIONAL) link que é aberto quando o evento é clicado")
    ];
  }

  List<EventoCalendario> converterEventos(List<EventoCalendario> eventos) {
    final Map<int, List<EventoCalendario>> itemMap = HashMap();

    for (EventoCalendario evento in eventos) {
      if (itemMap[evento.mes] == null) {
        itemMap[evento.mes] = [];
      }

      itemMap[evento.mes]!.add(evento);
    }

    final List<EventoCalendario> items = [];

    for (int mes in itemMap.keys) {
      List<EventoCalendario> eventosMes = itemMap[mes]!;

      items.add(EventoCalendario(dia: 0, mes: 0, titulo: meses[mes]));
      items.addAll(eventosMes);
    }

    return items;
  }

  Widget getCalendario() {
    List<EventoCalendario> eventos = getEventosCalendario();

    List<EventoCalendario> items = converterEventos(eventos);

    return Container(
      color: Colors.white,
      height: 500,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      child: ListView.builder(
          shrinkWrap: true,
          addAutomaticKeepAlives: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final Widget titulo;

            if (item.mes == 0) {
              titulo = Text(item.titulo,
                  style: Theme.of(context).textTheme.headline4);
            } else {
              titulo = Paragraph(children: [
                BoldText(text: item.dia.toString()),
                NormalText(text: " - ${item.titulo}"),
              ]);
            }

            return ItemLista(
              child: Card(
                child: InkWell(
                  onTap: () {
                    if (item.url != null) {
                      launchUrl(Uri.parse(item.url.toString()));
                    }
                  },
                  child: ListTile(
                    title: titulo,
                    subtitle: Text(item.descricao == null
                        ? ""
                        : item.descricao.toString()),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget getMapaCampus() {
    return const Text("AQUI VAI FICAR O MAPA DO CAMPUS");
  }

  @override
  Widget getContent() {
    return Column(
      children: [
        const TitleText(text: "Bem Vindo!"),
        const Paragraph(children: [
          NormalText(
              text:
                  "Parabéns bixo e bixete da UNICAMP! Sabemos que nos últimos tempos você esteve pensando no vestibular, mas agora você "),
          BoldText(text: "passou"),
          NormalText(text: " e pode celebrar sua nova fase: a "),
          BoldText(text: "universidade"),
          NormalText(text: "!"),
        ]),
        const Paragraph(children: [
          NormalText(
              text:
                  "Nós, a Calourada Selva, preparamos este guia de sobrevivência para ajudá-lo a se virar nesta selva."),
        ]),
        const Paragraph(children: [
          NormalText(
              text:
                  "Aqui você encontrará diversas informações sobre a UNICAMP Barão Geraldo e Campinas para atender suas necessidades iniciais. Aproveite, estude, corra atrás dos seus objetivos divirta-se!"),
        ]),
        const Paragraph(children: [
          NormalText(
              text: "Além do guia, tem mais conteúdo em nossas redes sociais."),
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => launchUrl(
                      Uri.parse("https://www.facebook.com/calouradaselva")),
                  child: Image.asset("lib/src/assets/facebook.png"),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: GestureDetector(
                  onTap: () => launchUrl(
                      Uri.parse("https://www.instagram.com/calouradaselva")),
                  child: Image.asset("lib/src/assets/instagram.png"),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: GestureDetector(
                  onTap: () => launchUrl(
                      Uri.parse("https://www.tiktok.com/@calouradaselva")),
                  child: Image.asset("lib/src/assets/tiktok.png"),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 40, thickness: 2, color: Colors.black26),
        const TitleText(text: "Calendário"),
        Paragraph(children: [
          const NormalText(
              text:
                  "Há tempo para tudo debaixo do Sol, por isso não perca os prazos! Sempre dê uma olhada no "),
          LinkText(
              url:
                  "https://www.dac.unicamp.br/portal/calendario/2022/graduacao",
              text: "calendário oficial da DAC"),
          const NormalText(text: " e também no "),
          LinkText(
              url: "https://www.sae.unicamp.br/servicosocial/calendario",
              text: "calendário do SAE"),
          const NormalText(
              text:
                  ". Abaixo tem o calendário de eventos da Calourada Selva, mais detalhes em nosso instagram!"),
        ]),
        getCalendario(),
        const Divider(height: 40, thickness: 2, color: Colors.black26),
        const TitleText(text: "Campus"),
        getMapaCampus(),
        const Divider(height: 40, thickness: 2, color: Colors.black26),
        const TitleText(text: "Telefones Úteis"),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.grey[200],
                child: const CopyButton(
                    text: "Disque Informações - 102", toCopy: ["102"]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.grey[200],
                child: const CopyButton(
                    text: "Disque Denúncia - 181", toCopy: ["181"]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.grey[200],
                child: const CopyButton(
                    text: "Polícia Militar - 190", toCopy: ["190"]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.grey[200],
                child: const CopyButton(
                    text: "Ambulância (SAMU) - 192", toCopy: ["192"]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.grey[200],
                child:
                    const CopyButton(text: "Bombeiro - 193", toCopy: ["193"]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.grey[200],
                child: const CopyButton(
                    text: "Ministério da Saúde sobre COVID-19 - 196",
                    toCopy: ["196"]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.grey[200],
                child: const CopyButton(
                    text:
                        "Centro de Saúde de Barão - 3289-9691 / Av. Albino José Barbosa de Oliveira, 893",
                    toCopy: ["3289-9691"]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.grey[200],
                child: const CopyButton(
                    text:
                        "Delegacia Policial de Barão (7º distrito) - 3289-1088 / Av. Atílio Martini ou Av. 2",
                    toCopy: ["3289-1088"]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.grey[200],
                child: const CopyButton(
                    text: "Delegacia da Mulher - 3227-0080 / 3242-5003",
                    toCopy: ["3227-0080", "3242-5003"]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.grey[200],
                child: const CopyButton(
                    text: "Sanasa - 0800-772-1195 / 3735-5000",
                    toCopy: ["0800-772-1195", "3735-5000"]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.grey[200],
                child: const CopyButton(
                    text:
                        "Força e Luz (CPFL) - 0800-010-1010 / 3795-1705 / Whats: (19) 99908-8888",
                    toCopy: ["0800-010-1010", "3795-1705", "(19) 99908-8888"]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.grey[200],
                child: const CopyButton(
                    text: "Emergency House - 99637-5291 / 3289-2847",
                    toCopy: ["99637-5291", "3289-2847"]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.grey[200],
                child: const CopyButton(
                    text: "Chaveiro Santa Isabel - 3289-7417",
                    toCopy: ["3289-7417"]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.grey[200],
                child: const CopyButton(
                    text: "SOS Chaveiro e Fogão - 3288-0883",
                    toCopy: ["3288-0883"]),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.grey[200],
                child: const CopyButton(
                    text: "Prefeitura de Campinas - 156", toCopy: ["156"]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
