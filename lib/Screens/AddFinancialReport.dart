import 'package:dev/Componentes/MyWidgets.dart';
import 'package:flutter/material.dart';

import 'loginScreen.dart';

class AddFinancial extends StatefulWidget {
  @override
  _AddFinancialState createState() => _AddFinancialState();
}

class _AddFinancialState extends State<AddFinancial> {
  final financesTypeCon = new TextEditingController();
  final valueCon = new TextEditingController();
  final dateCon = new TextEditingController();
  final descriptionCon = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: Color.fromRGBO(0, 0, 0, 1),
        centerTitle: true,
        title: Text(
          'Nome da fazenda',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontSize: 15,
          ),
        ),
        leading: Builder(builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginMenu()));
              },
              alignment: Alignment.centerRight,
            ),
          );
        }),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Cadastro de Relatório Financeiro',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontSize: 18,
                    ),
                  ),
                ),
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 40,
                  height: 40,
                ),
              ],
            ),
            DropDownCreate(financesTypeCon, 'Lucro', 'Despesa'),
            MyWidgets().caixaTexto('Valor', valueCon),
            DatePick(dateCon, 'data'),
            
            
          ],
        ),
      ),
    );
  }
}
