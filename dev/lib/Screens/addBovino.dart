import 'package:dev/Componentes/MyWidgets.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

class AddBovino extends StatefulWidget {
  @override
  _AddBovinoState createState() => _AddBovinoState();
}

class _AddBovinoState extends State<AddBovino> {
  final creationTypeCon = new TextEditingController();
  final nameCon = new TextEditingController();
  final sexCon = new TextEditingController();
  final birthDateCon = new TextEditingController();
  final weightCon = new TextEditingController();
  final milkProducedCon = new TextEditingController();
  final lactationPeriodCon = new TextEditingController();

  String _wrongName;
  String _wrongCreationType;
  String _wrongSex;
  String _wrongBirthDate;
  bool _error = false;

  var _creationType;
  var _cattleName;
  var _sex;
  var _birthDate;
  var _weight;
  var _lactationPeriod;
  var _milkProduced;

  var day;
  var month;
  var year;
  String _date;

  void postCattle() {
    if (isEmpty() == false) {
      _error = false;
      print(farmController.farmId);
      cattleController
          .postCattles(_creationType, _cattleName, _sex, _birthDate, _weight,
              _milkProduced, _lactationPeriod, farmController.farmId)
          .then((resposta) => validate(resposta));
    } else {
      print("is empty");
      _error = true;
    }
  }

   String setDate(String dateTime) {
    setState(() {
      day = dateTime.substring(8, 10);
      month = dateTime.substring(5, 7);
      year = dateTime.substring(0, 4);
      _date ="$year-$month-$day";
      print(_date);
    });
    return _date;
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
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: TextButton(
                  onPressed: ()  {
                    setState(() {
                      if (creationTypeCon.text == '1')
                        _creationType = 'GADO_LEITEIRO';
                      else if (creationTypeCon.text == '2')
                        _creationType = 'GADO_CORTE';
                      else
                        _creationType = null;
                      _cattleName = nameCon.text;
                      _birthDate = setDate(birthDateCon.text);
                      sexCon.text == '1'
                          ? _sex = 'MALE'
                          : _sex = 'FEMALE';
                      _weight = weightCon.text;
                      _lactationPeriod = setDate(birthDateCon.text); // Arrumar isso, tem que ser lactationPeriodCon (Deixei por enquanto)
                      _milkProduced = milkProducedCon.text;
                    });

                    postCattle();
                    
                  },
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 15,
                      color: Color.fromRGBO(42, 174, 198, 1),
                    ),
                  ),
                )),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2.0, color: const Color.fromRGBO(20, 20, 20, 1)),
                  borderRadius: BorderRadius.circular(150),
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.cover), //http rquest in future.
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 26),
                  child: TextButton(
                    onPressed: () {
                      print("Mudar");
                    },
                    child: Text(
                      "Selecionar Avatar",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              ErrorText(_error),
              DropDownCreate(
                creationTypeCon,
                'Leiteiro',
                'Corte', errorText: _wrongCreationType,
              ),
              MyWidgets().caixaTexto('Identificação:', nameCon, errorText: _wrongName),
              GenderPicker(sexCon, errorText: _wrongSex,),
              DatePick(birthDateCon, "Data de Nascimento", errorText: _wrongBirthDate,),
              MyWidgets().caixaTexto('Peso', weightCon),
              MyWidgets()
                  .caixaTexto('Quantidade de leite diário', milkProducedCon),
              MyWidgets().caixaTexto('Periodo de lactação', lactationPeriodCon),
            ],
          ),
        ));
  }

  bool isEmpty() {
    String text = "";
    bool empty = false;
    setState(() {
      _creationType.isEmpty ? _wrongCreationType = text : _wrongCreationType = null;
      _cattleName.isEmpty ? _wrongName = text : _wrongName = null;
      _birthDate.isEmpty ? _wrongBirthDate = text : _wrongBirthDate = null;
      _sex.isEmpty ? _wrongSex = text : _wrongSex = null;
    });
    if (_creationType.isEmpty || _cattleName.isEmpty ||
        _birthDate.isEmpty ||
        _sex.isEmpty) {
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
          "Bovino criado com sucesso.",
          onPressed: () async {
            await cattleController.getCattles();
            Navigator.of(context).pop();
          },
        ),
      );
    }
  }
}
