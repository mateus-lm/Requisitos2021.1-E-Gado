import 'package:dev/Componentes/MyWidgets.dart';
import 'package:flutter/material.dart';

class LoginMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
    body: Container(
      padding: EdgeInsets.only(left: 20.0,right: 20.0, top: 30.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50.0, bottom: 30),
            alignment: Alignment.topLeft,
            child: Text('Bem vindo!', textAlign: TextAlign.left, style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: 'PT Sans',
              fontWeight: FontWeight.bold,
            ),),
          ),
          MyWidgets().caixaTexto('Nome'),
          MyWidgets().caixaTexto('Senha'),
          MyWidgets().textButton('Criar Conta', 200, 40, 20, Colors.black,
                () {
              print("Tela de registro");
            }),
          MyWidgets().button('Entrar', 320.0, 50.0, 26, Theme.of(context).primaryColor, (){
            print("Entrar");
            // Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => MainScreen()));
          }),
          
        ],
      ),
    ),);
  }
}
