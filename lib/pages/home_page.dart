import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Conversor de Moedas"),
      ),
      body: ListView(children: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Center(
                child: FaIcon(FontAwesomeIcons.circleDollarToSlot,
                    color: Colors.yellow, size: 140),
              ),
              Divider(
                color: Colors.blue,
              ),
              Text(
                "Reais: ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "R\$ 0,00",
                  fillColor: Colors.white70,
                ),
              ),
              Text(
                "Dólar: ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "U\$ 0,00",
                  fillColor: Colors.white70,
                ),
              ),
              Text(
                "Euro: ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "E\$ 0,00",
                  fillColor: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
