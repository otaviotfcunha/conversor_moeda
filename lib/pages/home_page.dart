import 'package:conversor_moeda/repositories/moedas_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerReal = TextEditingController();
  TextEditingController controllerDolar = TextEditingController();
  TextEditingController controllerEuro = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MoedasRepository moedas = MoedasRepository();
    moedas.pegarDados();

    void limparCampos() {
      controllerReal.text = "";
      controllerDolar.text = "";
      controllerEuro.text = "";
    }

    void alteraReal(String texto) {
      if (texto.isEmpty) {
        limparCampos();
      }
      double? valorReal = double.tryParse(texto);

      if (valorReal != null) {
        late double? dol = moedas.dolar;
        late double? eur = moedas.euro;
        controllerDolar.text = (valorReal * dol!).toStringAsFixed(2);
        controllerEuro.text = (valorReal * eur!).toStringAsFixed(2);
      }
    }

    void alteraDolar(String texto) {
      if (texto.isEmpty) {
        limparCampos();
      }
      double? valorReal = double.tryParse(texto);

      if (valorReal != null) {
        late double? dol = moedas.dolar;
        late double? eur = moedas.euro;
        double val = valorReal / dol!;
        controllerReal.text = (val).toStringAsFixed(2);
        controllerEuro.text = (val * eur!).toStringAsFixed(2);
      }
    }

    void alteraEuro(String texto) {
      if (texto.isEmpty) {
        limparCampos();
      }
      double? valorReal = double.tryParse(texto);

      if (valorReal != null) {
        late double? dol = moedas.dolar;
        late double? eur = moedas.euro;
        double val = valorReal / eur!;
        controllerReal.text = (val).toStringAsFixed(2);
        controllerDolar.text = (val * dol!).toStringAsFixed(2);
      }
    }

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Conversor de Moedas"),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              const Center(
                child: FaIcon(FontAwesomeIcons.circleDollarToSlot,
                    color: Colors.yellow, size: 140),
              ),
              const Divider(
                color: Colors.blue,
              ),
              const Text(
                "Reais: ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              TextField(
                controller: controllerReal,
                onChanged: alteraReal,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "R\$ 0,00",
                  fillColor: Colors.white70,
                ),
              ),
              const Text(
                "Dólar: ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              TextField(
                controller: controllerDolar,
                onChanged: alteraDolar,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "U\$ 0,00",
                  fillColor: Colors.white70,
                ),
              ),
              const Text(
                "Euro: ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              TextField(
                controller: controllerEuro,
                onChanged: alteraEuro,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
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
