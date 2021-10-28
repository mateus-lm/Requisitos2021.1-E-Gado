import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:dev/globals.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'cattleController.g.dart';

class CattleController = CattleControllerBase with _$CattleController;

// final _storage = new FlutterSecureStorage();

abstract class CattleControllerBase with Store {
  @observable
  String cattleName = '';

  @action
  changeCattleName(String value) => cattleName = value;

  @observable
  String cattleType = '';

  @action
  changeCattleType(String value) => cattleType = value;

  @observable
  String cattleGender = '';

  @action
  changeCattleGender(String value) => cattleGender = value;

  @observable
  String cattleBirthDay = '';

  @action
  changeCattleBirthDay(String value) => cattleBirthDay = value;

  @observable
  String cattleWeight = '';

  @action
  changeCattleWeight(String value) => cattleWeight = value;

  @observable
  String cattleMilkProduced = '';

  @action
  changeCattleMilkProduced(String value) => cattleMilkProduced = value;

  @observable
  String cattleLactationPeriod = '';

  @action
  changeCattleLactationPeriod(String value) => cattleLactationPeriod = value;

  @observable
  int cattleId = 0;

  @action
  changeCattleId(int value) => cattleId = value;

  @observable
  List cattleList;

  @action
  changecattleList(List value) => cattleList = value;

  @observable
  int contLeiteiro = 0;

  @action
  changeContLeiteiro(int value) => contLeiteiro = value;

  @observable
  int contCorte = 0;

  @action
  changeContCorte(int value) => contCorte = value;

  @observable
  int contTotal = 0;

  @action
  changeContTotal(int value) => contTotal = value;

  @observable
  int contMaleL = 0;

  @action
  changeContMaleL(int value) => contMaleL = value;

  @observable
  int contFemaleL = 0;

  @action
  changeContFemaleL(int value) => contFemaleL = value;

  @observable
  int contMaleC = 0;

  @action
  changeContMaleC(int value) => contMaleC = value;

  @observable
  int contFemaleC = 0;

  @action
  changeContFemaleC(int value) => contFemaleC = value;

  @observable
  int qtdMilk = 0;

  @action
  changeQtdMilk(int value) => qtdMilk = value;

  @action
  getCattles() async {
    Response response = await api.getCattles();
    changecattleList(response.data);
    return response.data;
  }

  @action
  getListCattles() async {
    var list = <dynamic>[];
    int contL = 0;
    int contC = 0;
    int contT = 0;
    int contMaleL = 0;
    int contFemaleL = 0;
    int contMaleC = 0;
    int contFemaleC = 0;
    int qtdMilkD = 0;

    assert(list.isEmpty);
    for (int i = 0; i < cattleList.length; i++) {
      if (cattleList[i]['farm'] == farmController.farmId) {
        list.add(cattleList[i]);
        contT++;
        if (cattleList[i]['type_cattle'] == 'GADO_LEITEIRO') {
          contL++;
          if (cattleList[i]['gender'] == 'MALE') {
            contMaleL++;
          } else if (cattleList[i]['gender'] == 'FEMALE') {
            contFemaleL++;
            qtdMilkD += int.parse(cattleList[i]['qtd_milk']);
          }
        } else if (cattleList[i]['type_cattle'] == 'GADO_CORTE') {
          contC++;
          if (cattleList[i]['gender'] == 'MALE') {
            contMaleC++;
          } else if (cattleList[i]['gender'] == 'FEMALE') {
            contFemaleC++;
          }
        }
      }
    }
    changeQtdMilk(qtdMilkD);
    changeContFemaleL(contFemaleL);
    changeContMaleL(contMaleL);
    changeContFemaleC(contFemaleC);
    changeContMaleC(contMaleC);
    changeContCorte(contC);
    changeContLeiteiro(contL);
    changeContTotal(contT);
    return list;
  }

  @action
  postCattles(
      String creationType,
      String cattleId,
      String gender,
      String birthDay,
      String weigth,
      String qtdMilk,
      String daysToLactation,
      int farm) async {
    var resposta = true;
    try {
      await api.postCattles(creationType, cattleId, gender, birthDay, weigth,
          qtdMilk, daysToLactation, farm);
    } on DioError catch (err) {
      print("Erro: ${err.response.statusCode}");
      print("Erro: ${err.response.data}");
      resposta = false;
    }
    return resposta;
  }

  @action
  getCattleById(int cattleID) async {
    Response response = await api.getCattleById(cattleID);
    changeCattleId(response.data['id']);
    changeCattleType(response.data['type_cattle']);
    changeCattleName(response.data['id_cattle']);
    changeCattleGender(response.data['gender']);
    changeCattleBirthDay(response.data['birth_day']);
    changeCattleWeight(response.data['weigth']);
    changeCattleMilkProduced(response.data['qtd_milk']);
    changeCattleLactationPeriod(response.data['days_to_lactation']);
    return response.data;
  }

  updateCattle(
      int cattleId,
      String cattleName,
      String creationType,
      String gender,
      String birthDay,
      String weigth,
      String qtdMilk,
      String daysToLactation,
      int farm) async {
    var resposta = true;
    print(farm);
    try {
      await api.updateCattle(cattleId, cattleName, creationType, gender,
          birthDay, weigth, qtdMilk, daysToLactation, farm);
    } on DioError catch (err) {
      resposta = false;
      print('erro');
      print("Erro: ${err.response.statusCode}");
      print("Erro: ${err.response.data}");
    }
    return resposta;
  }

  deleteCattle(int cattleId) async {
    try {
      await api.deleteCattleById(cattleId);
    } on DioError catch (err) {
      print("Erro: ${err.response.statusCode}");
    }
  }
}
