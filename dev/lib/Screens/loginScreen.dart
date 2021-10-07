import 'package:dev/Componentes/MyWidgets.dart';
import 'package:dev/Screens/addBovino.dart';
import 'package:dev/Screens/addFarm.dart';
import 'package:dev/Screens/homeFarm.dart';
import 'package:flutter/material.dart';
import 'homeFarm.dart';
import 'addFarm.dart';
import '../Controllers/userController.dart';
import 'package:dev/globals.dart';

class LoginMenu extends StatefulWidget {
  @override
  _LoginMenuState createState() => _LoginMenuState();
}

class _LoginMenuState extends State<LoginMenu> {
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();

  var _email;
  var _password;
  String _wrongEmail;
  String _wrongPassword;

  void mudaTela(bool resposta) async {
    if (resposta == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddFarm()));
    } else {
      setState(() {
        _wrongEmail = "";
        _wrongPassword = "Email e/ou senha inválidos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/logo.png')),
            Text(
              'e-Gado',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50.0, bottom: 30),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text(
                    'Bem vindo!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'PT Sans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            MyWidgets().caixaTexto('Email', emailCon, errorText: _wrongEmail),
            MyWidgets().caixaTexto('Senha', passwordCon, isObscure: true ,errorText: _wrongPassword),
            Align(
              alignment: Alignment
                  .centerRight, // Align however you like (i.e .centerRight, centerLeft)
              child: MyWidgets().textButton(
                  'Esqueci a senha ?', 180, 40, 15, Colors.blue, () {
                print("Clique em esqueci senha ?");
              }),
            ),
            MyWidgets().textButton('Criar Conta', 200, 40, 20, Colors.black,
                () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeFarm()));
              print("Tela de registro");
            }),
            MyWidgets().button(
                'Entrar', 320.0, 50.0, 26, Theme.of(context).primaryColor, () {
              setState(() {
                _email = emailCon.text;
                _password = passwordCon.text;
              });

               userController
                  .login(_email, _password)
                  .then((resposta) => mudaTela(resposta));
            }),
          ],
        ),
      ),
    );
  }
}
