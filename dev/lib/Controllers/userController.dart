// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:dev/globals.dart';

part 'userController.g.dart';

class UserController = UserControllerBase with _$UserController;

// final _storage = new FlutterSecureStorage();

abstract class UserControllerBase with Store {
  @observable
  String email = '';

  @action
  changeEmail(String value) => email = value;

  @observable
  String token = '';

  @action
  changeToken(String value) => token = value;

  @observable
  bool isRegister = false;

  @action
  changeRegister(bool value) => isRegister = value;

  @action
  @action
  login(String email, String password) async {
    var resposta = true;
    try {
      Response response = await api.auth(email, password);
      String tokens = response.data['tokens'];
      int tam = tokens.length;
      changeToken(tokens.substring(12, tam - 2));
      changeEmail(response.data['email']);
      // await _storage.write(key: 'email', value: email);
      // await _storage.write(key: 'password', value: password);
      // await _storage.write(key: 'token', value: token);

    } on DioError catch (err) {
      print("Erro: ${err.response.statusCode}");
      resposta = false;
    }
    return resposta;
  }

  @action
  // persistLogin() async {
  //   bool _resposta = true;
  //   try {
  //     String _password = await _storage.read(key: 'password');
  //     String _email = await _storage.read(key: 'email');
  //     bool rLogin = await login(_email, _password);
  //     if (!rLogin) _resposta = false;
  //   } catch (err) {
  //     _resposta = false;
  //   }
  //   return _resposta;
  // }

  @action
  logout() async {
    changeToken('');
    // await _storage.write(key: 'profileIndex', value: "0");
    // await _storage.deleteAll();
  }

  // checkToken() async {
  //   bool _resposta = true;
  //   bool hasExpired = JwtDecoder.isExpired(token);
  //   if (hasExpired) {
  //     if (!await persistLogin()) _resposta = false;
  //   }
  //   return _resposta;
  // }

  @action
  register(String email, String userName, String password) async {
    String resposta = "true";
    changeRegister(true);
    try {
      await api.registerUser(email, userName, password);
      await login(email, password);
    } catch (err) {
      return err.response.data.toString();
    }

    return resposta;
  }
}
