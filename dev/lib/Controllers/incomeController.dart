import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:dev/globals.dart';

part 'incomeController.g.dart';

class IncomeController = IncomeControllerBase with _$IncomeController;

abstract class IncomeControllerBase with Store {
  
  @observable
  int incomeId = 0;

  @action
  changeIncomeId(int value) => incomeId = value;

  @observable
  String incomeType = '';

  @action
  changeIncomeType(String value) => incomeType = value;

  @observable
  String incomeValue = '';

  @action
  changeIncomeValue(String value) => incomeValue = value;

  @observable
  String incomeDate = '';

  @action
  changeIncomeDate(String value) => incomeDate = value;
  
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
  postIncome(String incomeType, String value, String date, String description,
      int farm) async {
    var resposta = true;
    try {
      await api.postIncome( incomeType,  value,  date,  description,
       farm);
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
    changeIncomeValue(response.data['value']);
    changeIncomeId(response.data['id']);
    changeIncomeDate(response.data['date']);
    changeIncomeType(response.data['income_type']);


    return response.data;
  }

  updateIncome(String incomeType,
    String value,
    String date,
    String description,
    int incomeId,
    int farm,) async {
    var resposta = true;
    try {
      await api.updateIncome(incomeType,
     value,
     date,
     description,
     incomeId,
     farm,);
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
