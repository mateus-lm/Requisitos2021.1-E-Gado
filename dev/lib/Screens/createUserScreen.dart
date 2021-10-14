import 'package:dev/Componentes/MyWidgets.dart';
import 'package:dev/Screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:dev/globals.dart';

class CreateUserScreen extends StatefulWidget {
  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();
  final nameCon = TextEditingController();

  var _email;
  var _userName;
  var _password;
  String _wrongEmail;
  String _wrongUserName;
  String _wrongPassword;

  void validateLogin(String resposta) async {
    if (resposta == "true") {
      showDialog(
          context: context,
          builder: (_) => PopUpAlertDialog(
                "Usuário cadastrado com sucesso",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginMenu()));
                },
              ));
    } else {
      setState(() {
        if (resposta.contains("email:")) {
          if (resposta.contains("email: [This field may not be blank.]"))
            _wrongEmail = "Email não pode ser branco.";
          else if (resposta.contains("email: [Enter a valid email address.]"))
            _wrongEmail =
                "Email inválido, entre com um email válido. ex.email@exemplo.com";
          else if (resposta
              .contains("email: [user with this email already exists.]"))
            _wrongEmail = "Email já cadastrado, entre com um email válido";
        } else
          _wrongEmail = null;

        if (resposta.contains("username: [This field may not be blank.]"))
          _wrongUserName = "Nome não pode ser branco ou nulo.";
        else
          _wrongUserName = null;

        if (resposta.contains("password:")) {
          if (resposta.contains("password: [This field may not be blank.]"))
            _wrongPassword = "Senha não pode ser branco ou nulo.";
          else if (resposta.contains(
              "password: [Ensure this field has at least 6 characters.]"))
            _wrongPassword = "Senha deve conter no mínimo 6 caractéres.";
        } else
          _wrongPassword = null;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
            child: Column(children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 50.0),
                    child: Image(image: AssetImage('assets/images/logo.png')),
                  ),
                ],
              ),
              MyWidgets().caixaTexto(
                'Nome',
                nameCon,
                errorText: _wrongUserName,
              ),
              MyWidgets().caixaTexto('Email', emailCon, errorText: _wrongEmail),
              MyWidgets().caixaTexto('Senha', passwordCon,
                  isObscure: true, errorText: _wrongPassword),
              Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: MyWidgets().button(
                    'Criar conta',
                    200,
                    40,
                    15,
                    Theme.of(context).primaryColor,
                    () {
                      setState(() {
                        _email = emailCon.text;
                        _userName = nameCon.text;
                        _password = passwordCon.text;
                      });
                      //  userController
                      //     .register(_email, _userName, _password)
                      //     .then((resposta) => mudaTela(resposta));
                      userController
                          .register(_email, _userName, _password)
                          .then((resposta) => validateLogin(resposta));
                    },
                    textColor: Colors.black,
                  ))
            ])));
  }
}
