import 'package:dio/dio.dart';
import 'Services/api.dart';

Api api = new Api();

var options = BaseOptions(
  baseUrl: 'https://e-vacina-backend.herokuapp.com',  
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

var dio = Dio(options);