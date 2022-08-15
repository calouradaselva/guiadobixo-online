import 'package:flutter/material.dart';
import 'package:guiadobixo/src/pages/page.dart';
import 'package:guiadobixo/src/widgets/paragraph.dart';
import 'package:guiadobixo/src/widgets/text.dart';

class VidaAcademicaPage extends AppPage {
  const VidaAcademicaPage({Key? key, required title})
      : super(key: key, title: title);

  @override
  Widget getContent() {
    return Column(
      children: [
        Image.asset("lib/src/assets/vida_academica.png"),
        const TitleText(text: "Vida Acadêmica"),
        const Paragraph(children: [
          NormalText(
              text:
                  "Nesta seção você irá encontrar informações de plataformas e orgãos intimamente ligados a sua vida acadêmica."),
        ]),
        const Divider(height: 40, thickness: 2, color: Colors.black26),
        const TitleText(text: "SAE"),
        const Paragraph(children: [
          NormalText(
              text:
                  "O Serviço de Apoio ao Estudante existe para dar aquele apoio para nós, humildes estudantes, principalmente nas questões financeiras. São eles que fornecem bolsas estudantis. Há vários tipos de bolsas, como por exemplo: "),
        ]),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(children: const [
            Paragraph(children: [
              NormalText(
                  text:
                      "\u2022 Bolsas Sociais: destinadas para estudantes que comprovem dificuldades financeiras para garantir sua permanência na universidade.")
            ]),
            Paragraph(children: [
              NormalText(
                  text:
                      "\u2022 Bolsas Culturais: tem como objetivo estimular a efervescência artística-cultural nos espaços da universidade, além de auxiliar na permanência estudantil.")
            ]),
            Paragraph(children: [
              NormalText(
                  text:
                      "\u2022 Bolsa Pesquisa: tem como objetivo incentivar estudantes da graduação a participarem das atividades da Iniciação Científica.")
            ]),
          ]),
        ),
        Paragraph(children: [
          const NormalText(text: "Todas as bolsas estão descritas "),
          LinkText(
              url:
                  "https://www.sae.unicamp.br/saewiki/index.php/P%C3%A1gina_principal",
              text: "aqui"),
          const NormalText(
              text:
                  ". Fique atento aos prazos! As bolsas têm tempo de inscrição, e eles são improrrogáveis. O SAE também disponibiliza oficinas e palestras de diversos temas, visando auxiliar e facilitar a vida universitária, que convenhamos não é nem um pouco fácil. Outro serviço que está a encargo do SAE cuidar são os estágios, mas isso é algo que você só deve se preocupar mais para metade/final do curso. Para ter mais informações, como valores e requisitos das bolsas, eventos e sobre auxílio psicológico, acesse o "),
          LinkText(url: "https://www.sae.unicamp.br/portal/pt/#", text: "site"),
          const NormalText(text: "."),
        ]),
        const Divider(height: 40, thickness: 2, color: Colors.black26),
        const TitleText(text: "DAC"),
        const Paragraph(children: [
          NormalText(
              text:
                  "A DAC (Diretoria Acadêmica), localizada no prédio do Ciclo Básico II (mais conhecido como PB) pode também ser conhecida como \"aquilo que te auxilia nos problemas universitários\". Perdeu o RA? (Acontece… Mas tome cuidado! A 2ª via é paga.) Vá pra DAC. Tá com dúvidas referentes ao histórico? DAC. Disciplinas? Adivinha...? DAC. A DAC é o salva-vidas acadêmico! Isso significa que vocês precisarão recorrer muito a ela durante os (longos) anos em que ficarão na Universidade, e em especial nesse período online. Muitas coisas podem ser feitas através do site: DAC - Unicamp , então guardem-o bem. No site da DAC, ao acessar a sessão Estudantes você pode:")
        ]),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(children: const [
            Paragraph(children: [
              NormalText(
                  text:
                      "\u2022 Realizar sua matrícula em disciplinas para o próximo semestre;")
            ]),
            Paragraph(children: [
              NormalText(
                  text:
                      "\u2022 Alterar suas matrículas do semestre e desistir de matérias;")
            ]),
            Paragraph(children: [
              NormalText(
                  text:
                      "\u2022 Alterar a opção de ênfase do curso (caso tenha);")
            ]),
            Paragraph(children: [
              NormalText(
                  text:
                      "\u2022 Acessar o e-mail institucional fornecido pela Unicamp;")
            ]),
            Paragraph(children: [
              NormalText(text: "\u2022 Solicitar passe escolar;")
            ]),
            Paragraph(children: [
              NormalText(text: "\u2022 Fazer testes de proficiência;")
            ]),
            Paragraph(children: [
              NormalText(
                  text:
                      "\u2022 Acessar o GDE para formular grade horária do semestre;")
            ]),
            Paragraph(children: [
              NormalText(
                  text:
                      "\u2022 Acessar os sites das disciplinas Moodle e Google Classroom;")
            ]),
            Paragraph(children: [
              NormalText(text: "\u2022 Acessar o Pacote Office Online.")
            ]),
          ]),
        ),
        const Divider(height: 40, thickness: 2, color: Colors.black26),
        const TitleText(text: "Matrículas e o GDE"),
        Paragraph(children: [
            const NormalText(text: "Ao entrar, você já está matriculado nas disciplinas. Mas a cada novo semestre você irá precisar montar sua grade horária e se matricular pelo site da DAC. Para planejar sua grade você pode usar o "),
            LinkText(url: "https://grade.daconline.unicamp.br/login/", text: "GDE"),
            const NormalText(text: ", que é uma espécie de rede social acadêmica da Unicamp, na qual você acessa com seu login e senha da DAC. Após a matrícula, não esqueça de verificar se foi aceito em todas as disciplinas/turmas solicitadas. Caso não, você ainda tem o período de alteração para mudar sua grade."),
        ]),
        const Divider(height: 40, thickness: 2, color: Colors.black26),
        const TitleText(text: "CEL - Centro de Ensino de Línguas"),
        const Paragraph(children: [NormalText(text: "Oferece disciplinas de línguas estrangeiras (gratuitas) para os alunos. No início de cada semestre é possível se matricular em alguma língua e, caso você já tenha conhecimento, pode fazer o teste de proficiência para saber seu nível. Lembrando que as vagas são limitadas e determinados cursos possuem prioridade. Mas fica tranquilo, muitas atléticas da Unicamp têm cursos de idiomas com um preço semestral acessível, então esteja atento.")]),
        const Divider(height: 40, thickness: 2, color: Colors.black26),
        const TitleText(text: "Moodle e Google Classroom"),
        Paragraph(children: [
            const NormalText(text: "Essas são duas plataformas usadas pelos professores para passar o material, as atividades e aplicar provas. A escolha de qual usar fica a cargo do professor, por isso é bom se habituar com as duas. O Moodle pode ser acessado pelo site "),
            LinkText(url: "https://moodle.ggte.unicamp.br/", text: "Unicamp"),
            const NormalText(text: ", e o Google Classroom pode ser acessado pelo "),
            LinkText(url: "https://classroom.google.com/u/1/h", text: "site"),
            const NormalText(text: " ou no celular pelo "),
            LinkText(url: "https://play.google.com/store/apps/details?id=com.google.android.apps.classroom", text: "app"),
            const NormalText(text: ". O acesso é feito com seu e-mail institucional (ou RA) e senha."),
        ]),
        const Divider(height: 40, thickness: 2, color: Colors.black26),
        const TitleText(text: "E-mail institucional e ferramentas Google"),
        Paragraph(children: [
            const NormalText(text: "Ao se matricular na Unicamp, um e-mail institucional é feito pra você, onde você vai receber todos os e-mails com mensagens da Unicamp, da DAC, do SAE, e vai usar para acessar as ferramentas do Google, que vão ser bem úteis, como o "),
            LinkText(url: "https://meet.google.com/landing", text: "Google Meet"),
            const NormalText(text: " (realizar chamadas em áudio e vídeo, além de poder gravá-las) e "),
            LinkText(url: "https://drive.google.com/drive/my-drive", text: "Google Drive"),
            const NormalText(text: " (armazenamento na nuvem e compartilhar arquivos). O seu e-mail institucional vai ter sempre a mesma fórmula: 1ª letra do seu nome + seu RA + @dac.unicamp.br"),
        ]),
      ],
    );
  }
}
