import 'package:dev/Screens/FinancialScreen.dart';
import 'package:flutter/material.dart';
import 'package:dev/Componentes/MyWidgets.dart';
import '../globals.dart';

class ConfigFinancial extends StatefulWidget {
  @override
  _ConfigFinancialState createState() => _ConfigFinancialState();
}

class _ConfigFinancialState extends State<ConfigFinancial> {
  final financesTypeCon = new TextEditingController();
  final valueCon = new TextEditingController();
  final dateCon = new TextEditingController();
  final descriptionCon = new TextEditingController();

  var _financesType;
  var _value;
  var _date;
  var _description;

  String _wrongFinancesType;
  String _wrongValue;
  String _wrongDate;
  String _wrongDescription;
  bool _error = false;

  var day;
  var month;
  var year;
  String _dateT;

  String setDate(String dateTime) {
    if (dateTime.isEmpty) {
      return null;
    }
    setState(() {
      day = dateTime.substring(8, 10);
      month = dateTime.substring(5, 7);
      year = dateTime.substring(0, 4);
      _dateT = "$year-$month-$day";
      print(_dateT);
    });
    return _dateT;
  }

  void updateIncome() {
    if (isEmpty() == false) {
      _error = false;
      incomeController
          .updateIncome(_financesType, _value, _date, _description,
              incomeController.incomeId, farmController.farmId)
          .then((resposta) => validate(resposta));
    } else {
      _error = true;
    }
  }

  @override
  void initState() {
    super.initState();
    print(incomeController.incomeType);
    incomeController.incomeType == "LUCRO" ? financesTypeCon.text = '1': financesTypeCon.text = '2' ;
    valueCon.text = incomeController.incomeValue;
    dateCon.text = incomeController.incomeDate;
    descriptionCon.text = incomeController.incomeDescription;
  }

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
            DropDownCreate(
                financesTypeCon, 'Tipo de gasto', 'Lucro', 'Despesa', dropdownValue: financesTypeCon.text,),
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
                      'Excluir', 100, 40, 15, Colors.redAccent[700], () {
                        incomeController.deleteIncome(incomeController.incomeId).then((resposta) => validateDelete(resposta));
                  }),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 30.0),
                    child: MyWidgets().button(
                        'Salvar', 100, 40, 15, Colors.greenAccent[700], () {
                      setState(() {
                        if (financesTypeCon.text == '1')
                          _financesType = 'LUCRO';
                        else if (financesTypeCon.text == '2')
                          _financesType = 'DESPESA';
                        else
                          _financesType = null;
                        _value = valueCon.text;
                        _date = setDate(dateCon.text);
                        _description = descriptionCon.text;
                      });
                      updateIncome();
                    })),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool isEmpty() {
    String text = "";
    bool empty = false;
    setState(() {
      _financesType == null
          ? _wrongFinancesType = text
          : _wrongFinancesType = null;
      _value.isEmpty ? _wrongValue = text : _wrongValue = null;
      _date == null ? _wrongDate = text : _wrongDate = null;
      _description == null
          ? _wrongDescription = text
          : _wrongDescription = null;
    });
    if (_financesType == null ||
        _value.isEmpty ||
        _date == null ||
        _description == null) {
      empty = true;
    }
    return empty;
  }

  void validate(bool resposta) {
    if (resposta == true) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => PopUpAlertDialog(
          "Finança atualizada com sucesso.",
          onPressed: () async {
            await incomeController.getIncome();
            await incomeController.getValues();
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FinancialScreen()));
          },
        ),
      );
    }
  }

   void validateDelete(bool resposta) async {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => PopUpAlertDialog(
          "Finança deletada com sucesso.",
          onPressed: () async {
            await incomeController.getIncome();
            await incomeController.getValues();
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FinancialScreen()));
          },
        ),
      );
    }
}
