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

  @action
  getCattles() async {
    Response response = await api.getCattles();
    return response.data;
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
  getCattleById(String cattleID) async {
    Response response = await api.getCattleById(cattleID);
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
      String cattleId,
      String creationType,
      String gender,
      String birthDay,
      String weigth,
      String qtdMilk,
      String daysToLactation,
      int farm) async {
    var resposta = true;
    try {
      await api.updateCattle(cattleId, creationType, gender, birthDay, weigth,
          qtdMilk, daysToLactation, farm);
    } on DioError catch (err) {
      resposta = false;
      print('erro');
      print("Erro: ${err.response.statusCode}");
    }
    return resposta;
  }
}
