import 'package:flutter/material.dart';

abstract class AppPage extends StatelessWidget {
  final String title;

  const AppPage({Key? key, required this.title}) : super(key: key);

  Widget getContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/src/assets/background.png"),
          repeat: ImageRepeat.repeatY,
        ),
        color: Color(0xffffbd59),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: Image.asset("lib/src/assets/logo.png"),
              ),
              ListTile(
                title: const Text("Home"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/home");
                },
              ),
              ListTile(
                title: const Text("Vida Acadêmica"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/vidaAcademica");
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 70, right: 70, bottom: 0),
            child: Column(
              children: [
                getContent(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 30, right: 30, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Image.asset(
                              "lib/src/assets/calourada_selva.jpg")),
                      const SizedBox(width: 30),
                      Expanded(
                          child: Image.asset("lib/src/assets/unicamp.png")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
