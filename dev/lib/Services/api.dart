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
    var token = userController.token;
    Response response = await dio.get(
      '/cattle/',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
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
        "farm": farm,
      },
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @action
  getCattleById(int cattleId) async {
    var token = userController.token;
    Response response = await dio.get(
      '/cattle/$cattleId',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @action
  updateCattle(
    int cattleId,
    String cattleName,
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
        "id_cattle": cattleName,
        "gender": gender,
        "birth_day": birthDay,
        "weigth": weigth,
        "qtd_milk": qtdMilk,
        "days_to_lactation": daysToLactation,
        "farm": farm
      },
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @action
  patchCattleById(int cattleId) async {
    Response response = await dio.patch(
      '/cattle/$cattleId',
      data: {},
    );
    return response;
  }

  @action
  deleteCattleById(int cattleId) async {
    var token = userController.token;
    Response response = await dio.delete(
      '/cattle/$cattleId',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @action
  getFarms() async {
    var token = userController.token;
    Response response = await dio.get(
      '/farm/',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  postFarm(String nameFarm, String city, String state, String size) async {
    var token = userController.token;
    Response response = await dio.post(
      '/farm/',
      data: {"name_farm": nameFarm, "city": city, "state": state, "tam": size},
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @action
  getFarmById(int farmId) async {
    var token = userController.token;
    Response response = await dio.get(
      '/farm/$farmId',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @action
  updatefarm(String nameFarm, String city, String state, String size,
      int farmId) async {
    var token = userController.token;
    Response response = await dio.put(
      '/farm/$farmId',
      data: {"name_farm": nameFarm, "city": city, "state": state, "tam": size},
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @action
  deleteFarmById(int farmId) async {
    var token = userController.token;
    Response response = await dio.delete(
      '/farm/$farmId',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @action
  getIncome() async {
    var token = userController.token;
    Response response = await dio.get(
      '/income/',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  postIncome(String incomeType, String value, String date, String description,
      int farm) async {
    var token = userController.token;
    Response response = await dio.post(
      '/income/',
      data: {
        "income_type": incomeType,
        "value": value,
        "date": date,
        "description": description,
        "farm": farm,
      },
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @action
  getIncomeById(int incomeId) async {
    var token = userController.token;
    Response response = await dio.get(
      '/income/$incomeId',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @action
  updateIncome(
    String incomeType,
    String value,
    String date,
    String description,
    int incomeId,
    int farm,
  ) async {
    var token = userController.token;
    Response response = await dio.put(
      '/income/$incomeId',
      data: {
        "income_type": incomeType,
        "value": value,
        "date": date,
        "description": description,
        "farm": farm,
      },
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @action
  deleteIncomeById(int incomeId) async {
    var token = userController.token;
    Response response = await dio.delete(
      '/income/$incomeId',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }
}
