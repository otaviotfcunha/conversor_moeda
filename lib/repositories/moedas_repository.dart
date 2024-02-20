import 'package:conversor_moeda/models/moedas_model.dart';
import 'package:conversor_moeda/repositories/custom_dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MoedasRepository{
  final _customDio = CustomDio();

  MoedasRepository();

  Future<MoedasModel> listarMoedas() async {
    var url = "/finance/quotations?key=${dotenv.get("APPRESTAPI_KEY")}";
    var result = await _customDio.dio.get(url);
    return MoedasModel.fromJson(result.data);
  }

}