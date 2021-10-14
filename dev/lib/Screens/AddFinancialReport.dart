import 'package:dev/Componentes/MyWidgets.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

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
        title: Padding(
          padding: EdgeInsets.only(right: 30),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                radius: 17.5,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  MyWidgets().splitName(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Text(
              farmController.farmName,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'Roboto',
                fontSize: 15,
              ),
            ),
          ]),
        ),
        leading: Builder(builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
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
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30.0),
              child: Row(
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
            ),
            DropDownCreate(financesTypeCon, 'Lucro', 'Despesa'),
            MyWidgets().caixaTexto('Valor', valueCon),
            DatePick(dateCon, 'data'),
            Container(
              padding: EdgeInsets.only(bottom: 11.5),
              child: TextField(
                controller: descriptionCon,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  border: const OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black54),
                  labelText: 'Descrição',
                ),
                //controller: _textEditingController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 25.0, left: 20.0, top: 30.0),
                  child: MyWidgets().button(
                      'Cancelar', 100, 40, 15, Colors.redAccent[700], () {}),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 30.0),
                    child: MyWidgets().button(
                        'Salvar', 100, 40, 15, Colors.greenAccent[700], () {})),
              ],
            )
          ],
        ),
      ),
    );
  }
}
