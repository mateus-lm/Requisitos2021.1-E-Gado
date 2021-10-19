import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:dev/globals.dart';

part 'incomeController.g.dart';

class IncomeController = IncomeControllerBase with _$IncomeController;

abstract class IncomeControllerBase with Store {
  @observable
  String incomeDescription = '';

  @action
  changeIncomeDescription(String value) => incomeDescription = value;

  @action
  getIncome() async {
    Response response = await api.getIncome();
    return response.data;
  }

  @action
  postIncome(int farm) async {
    var resposta = true;
    try {
      await api.postIncome(farm);
    } on DioError catch (err) {
      print("Erro: ${err.response.statusCode}");
      print("Erro: ${err.response.data}");
      resposta = false;
    }
    return resposta;
  }

  @action
  getIncomeById(int incomeID) async {
    Response response = await api.getIncomeById(incomeID);
    changeIncomeDescription(response.data['description']);

    return response.data;
  }

  updateIncome(int incomeId, int farm) async {
    var resposta = true;
    try {
      await api.updateIncome(incomeId, farm);
    } on DioError catch (err) {
      resposta = false;
      print('erro');
      print("Erro: ${err.response.statusCode}");
    }
    return resposta;
  }

  deleteIncome(int incomeId) async {
    try {
      await api.deleteIncomeById(incomeId);
    } on DioError catch (err) {
      print("Erro: ${err.response.statusCode}");
    }
  }
}
