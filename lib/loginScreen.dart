import 'package:dev/Componentes/MyWidgets.dart';
import 'package:flutter/material.dart';

class LoginMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
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
            MyWidgets().caixaTexto('Email'),
            MyWidgets().caixaTexto('Senha'),
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
              print("Tela de registro");
            }),
            MyWidgets().button(
                'Entrar', 320.0, 50.0, 26, Theme.of(context).primaryColor, () {
              print("Entrar");
              // Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => MainScreen()));
            }),
          ],
        ),
      ),
    );
  }
}
