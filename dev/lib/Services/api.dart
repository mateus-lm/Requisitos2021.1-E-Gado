import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:dev/globals.dart';

import '../globals.dart';

part 'api.g.dart';
// import 'package:flutter/material.dart;'

class Api = ApiBase with _$Api;

abstract class ApiBase with Store {
  @action
  getUser() async {}

  @action
  auth(String email, String password) async {
    Response response = await dio.post('/auth/login/',
        data: {'email': '$email', 'password': '$password'});
    return response;
  }

  @action
  registerUser(String email, String userName, String password) async {
    Response response = await dio.post('/auth/register/', data: {
      'email': '$email',
      'username': '$userName',
      'password': '$password'
    });
    return response;
  }

  @action
  getCattles() async {
    Response response = await dio.get('/cattle/');
    return response;
  }

  postCattles(
      String creationType,
      String cattleId,
      String gender,
      String birthDay,
      String weigth,
      String qtdMilk,
      String daysToLactation,
      int farm) async {
    var token = userController.token;
    Response response = await dio.post(
      '/cattle/',
      data: {
        "type_cattle": creationType,
        "id_cattle": cattleId,
        "gender": gender,
        "birth_day": birthDay,
        "weigth": weigth,
        "qtd_milk": qtdMilk,
        "days_to_lactation": daysToLactation,
        "farm": 0
      },
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @action
  getCattleById(String cattleId) async {
    Response response = await dio.get('/cattle/$cattleId');
    return response;
  }

  @action
  updateCattle(
    String cattleId,
    String creationType,
    String gender,
    String birthDay,
    String weigth,
    String qtdMilk,
    String daysToLactation,
    int farm,
  ) async {
    var token = userController.token;
    Response response = await dio.put(
      '/cattle/$cattleId',
      data: {
        "type_cattle": creationType,
        "id_cattle": cattleId,
        "gender": gender,
        "birth_day": birthDay,
        "weigth": weigth,
        "qtd_milk": qtdMilk,
        "days_to_lactation": daysToLactation,
        "farm": 0
      },
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @action
  patchCattleById(String cattleId) async {
    Response response = await dio.patch(
      '/cattle/$cattleId',
      data: {},
    );
    return response;
  }

  @action
  deleteCattleById(String cattleId) async {
    Response response = await dio.delete('/cattle/$cattleId');
    return response;
  }

  @action
  getFarms() async {
    Response response = await dio.get('/farm/');
    return response;
  }

  postFarm(String nameFarm, String city, String state, String size) async {
    Response response = await dio.post('/farm/', data: {
      "name_farm": nameFarm,
      "city": city,
      "state": state,
      "tam": size
    });
    return response;
  }

  @action
  getFarmById(String farmId) async {
    Response response = await dio.get('/farm/$farmId');
    return response;
  }

  @action
  updatefarm(String nameFarm, String city, String state, String size,
      String farmId) async {
    Response response = await dio.put('/farm/$farmId', data: {
      "name_farm": nameFarm,
      "city": city,
      "state": state,
      "tam": size
    });
    return response;
  }

  @action
  deleteFarmById(String farmId) async {
    Response response = await dio.delete('/farm/$farmId');
    return response;
  }
}
