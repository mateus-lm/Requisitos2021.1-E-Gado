import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:dev/globals.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'farmController.g.dart';

class FarmController = FarmControllerBase with _$FarmController;

// final _storage = new FlutterSecureStorage();

abstract class FarmControllerBase with Store {
  @action
  get() async {
    Response response = await api.getFarms();
    return response.data["Farm"];
  }

  @action
  postFarm(String nameFarm, String city, String state, String size) async {
    var resposta = true;
    try {
      await api.postFarm(nameFarm, city, state, size);
    } on DioError catch (err) {
      print("Erro: ${err.response.statusCode}");
      resposta = false;
    }
    return resposta;
  }

  @action
  getFarmById(String farmId) async {
    Response response = await api.getFarmById(farmId);
    return response.data["Farm"];
  }


  updateFarm(String nameFarm, String city, String state, String size, String farmId) async {
    try {
      await api.updatefarm(nameFarm, city, state, size, farmId);
    } on DioError catch (err) {
      print('erro');
      print("Erro: ${err.response.statusCode}");
    }
  }

  deleteFarm(String farmId) async {
    try {
      await api.deleteFarmById(farmId);
    } on DioError catch (err) {
      print("Erro: ${err.response.statusCode}");
    }
  }
}