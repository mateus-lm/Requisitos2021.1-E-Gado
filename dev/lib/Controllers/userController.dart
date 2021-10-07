import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:dev/globals.dart';


part 'userController.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  @observable
  String email = '';

  @action
  changeEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  changePassword(String value) => password = value;

  @observable
  dynamic token = '';

  @action
  changeToken(dynamic value) => token = value;

  @observable
  bool isRegister = false;

  @action
  changeRegister(bool value) => isRegister = value;

  @action
  login(String email, String password) async {
    var resposta = true;
    try {
      Response response = await api.auth(email, password);
      changeToken(response.data['tokens']);
      changeEmail(response.data["email"]);
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
  //     String _index = await _storage.read(key: 'profileIndex') ?? "0";
  //     int intParse = int.parse(_index);
  //     profileController.changeCurrentIndex(intParse);
  //     bool rLogin = await login(_email, _password);
  //     if (!rLogin) _resposta = false;
  //   } catch (err) {
  //     _resposta = false;
  //   }
  //   return _resposta;
  // }

  @action
  // logout() async {
  //   changeToken('');
  //   changeUserId('');
  //   await _storage.write(key: 'profileIndex', value: "0");
  //   await _storage.deleteAll();
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