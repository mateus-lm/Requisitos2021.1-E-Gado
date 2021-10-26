import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:dev/globals.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'farmController.g.dart';

class FarmController = FarmControllerBase with _$FarmController;

// final _storage = new FlutterSecureStorage();

abstract class FarmControllerBase with Store {
  @observable
  String farmName = '';

  @action
  changeFarmName(String value) => farmName = value;

  @observable
  String farmCity = '';

  @action
  changeFarmCity(String value) => farmCity = value;

  @observable
  String farmState = '';

  @action
  changeFarmState(String value) => farmState = value;
  @observable
  String farmTam = '';

  @action
  changeFarmTam(String value) => farmTam = value;

  int farmId = 0;

  @action
  changeFarmId(int value) => farmId = value;

  @action
  getFarms() async {
    Response response = await api.getFarms();
    print('Get farms: ${response.data}');
    return response.data;
  }

  @action
  postFarm(String nameFarm, String city, String state, String size) async {
    var resposta = true;
    try {
      await api.postFarm(nameFarm, city, state, size);
    } on DioError catch (err) {
      print("Erro: ${err.response.statusCode}");
      print("Erro: ${err.response.data}");
      resposta = false;
    }
    return resposta;
  }

  @action
  getFarmById(int farmId) async {
    Response response = await api.getFarmById(farmId);
    changeFarmName(response.data['name_farm']);
    changeFarmCity(response.data['city']);
    changeFarmState(response.data['state']);
    changeFarmTam(response.data['tam']);
    changeFarmId(farmId);

    return response.data;
  }

  updateFarm(String nameFarm, String city, String state, String size,
      int farmId) async {
    var resposta = true;
    try {
      await api.updatefarm(nameFarm, city, state, size, farmId);
    } on DioError catch (err) {
      print('erro');
      print("Erro: ${err.response.statusCode}");
      resposta = false;
    }
    return resposta;
  }

  deleteFarm(int farmId) async {
    try {
      await api.deleteFarmById(farmId);
    } on DioError catch (err) {
      print("Erro: ${err.response.statusCode}");
    }
  }
}
