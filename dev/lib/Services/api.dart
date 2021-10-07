import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:dev/globals.dart';

part 'api.g.dart';
// import 'package:flutter/material.dart;'

class Api = ApiBase with _$Api;

abstract class ApiBase with Store {
  @action
  getUser() async {}

  @action
  auth(String email, String password) async {
    Response response = await dio
        .post('/auth/login/', data: {'email': '$email', 'password': '$password'});
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
    String creationType, String cattleId, String gender, String birthDay, String weigth, String qtdMilk,
    String daysToLactation, int farm) async {
    Response response = await dio.post('/cattle/', data: {
      "type_cattle": creationType,
      "id_cattle": cattleId,
      "gender": gender,
      "birth_day": birthDay,
      "weigth": weigth,
      "qtd_milk": qtdMilk,
      "days_to_lactation": daysToLactation,
      "farm": 0
    });
    return response;
  }

  @action
  getCattleById(String cattleId) async {
    Response response = await dio.get('/cattle/$cattleId');
    return response;
  }

  @action
  updateCattle(String cattleId,  String creationType, String gender, String birthDay, String weigth, String qtdMilk,
    String daysToLactation, int farm) async {
    Response response = await dio.put('/cattle/$cattleId', data: {
      "type_cattle": creationType,
      "id_cattle": cattleId,
      "gender": gender,
      "birth_day": birthDay,
      "weigth": weigth,
      "qtd_milk": qtdMilk,
      "days_to_lactation": daysToLactation,
      "farm": 0
    });
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
}

