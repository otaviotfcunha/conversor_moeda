import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MoedasRepository {
  double _dolar = 0.0;
  double _euro = 0.0;

  double? get dolar => _dolar;
  double? get euro => _euro;

  Future<void> pegarDados() async {
    Map dados;
    final Uri url = Uri.https(
        "api.hgbrasil.com", "/finance", {"key": dotenv.get("APPRESTAPI_KEY")});
    final resultado = await http.get(url);
    dados = json.decode(resultado.body);

    _dolar = dados["results"]["currencies"]["USD"]["buy"];
    _euro = dados["results"]["currencies"]["EUR"]["buy"];
  }
}
