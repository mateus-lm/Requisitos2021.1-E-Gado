import 'package:dev/Controllers/cattleController.dart';
import 'package:dev/Controllers/farmController.dart';
import 'package:dev/Controllers/userController.dart';
import 'package:dio/dio.dart';
import 'Services/api.dart';

Api api = new Api();
UserController userController = new UserController();
FarmController farmController = new FarmController();
CattleController cattleController = new CattleController();


var options = BaseOptions(
  baseUrl: 'https://egadoapi.herokuapp.com/',  
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

var dio = Dio(options);