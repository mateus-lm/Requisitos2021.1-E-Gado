import 'package:dev/Componentes/MyWidgets.dart';
import 'package:dev/Screens/CattlesScreen.dart';
import 'package:dev/Screens/homeFarm.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

class ConfigCattle extends StatefulWidget {
  @override
  _ConfigCattleState createState() => _ConfigCattleState();
}

class _ConfigCattleState extends State<ConfigCattle> {
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

  void updateCattle() {
    if (isEmpty() == false) {
      _error = false;
      cattleController
          .updateCattle(
              cattleController.cattleId,
              _cattleName,
              _creationType,
              _sex,
              _birthDate,
              _weight,
              _milkProduced,
              _lactationPeriod,
              farmController.farmId)
          .then((resposta) => validate(resposta));
    } else {
      _error = true;
      print("OLÁ");
    }
  }

  String setDate(String dateTime) {
    if (dateTime.isEmpty) {
      return null;
    }
    setState(() {
      day = dateTime.substring(8, 10);
      month = dateTime.substring(5, 7);
      year = dateTime.substring(0, 4);
      _date = "$year-$month-$day";
      print(_date);
    });
    return _date;
  }

  @override
  void initState() {
    super.initState();

    cattleController.cattleType == 'GADO_LEITEIRO' ? creationTypeCon.text = '1' : creationTypeCon.text = '2';
    nameCon.text = cattleController.cattleName;
    cattleController.cattleGender == 'MALE'? sexCon.text =  '1' : sexCon.text = '2';
    birthDateCon.text = cattleController.cattleBirthDay;
    weightCon.text = cattleController.cattleWeight;
    milkProducedCon.text = cattleController.cattleMilkProduced;
    lactationPeriodCon.text = cattleController.cattleLactationPeriod;
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
                'Tipo de Criação',
                'Leiteiro',
                'Corte',
                errorText: _wrongCreationType, dropdownValue: creationTypeCon.text,
              ),
              MyWidgets()
                  .caixaTexto('Identificação:', nameCon, errorText: _wrongName),
              GenderPicker(
                sexCon,
                errorText: _wrongSex, dropdownValue: sexCon.text,
              ),
              DatePick(
                birthDateCon,
                "Data de Nascimento",
                errorText: _wrongBirthDate,
              ),
              MyWidgets().caixaTexto('Peso(KG)', weightCon),
              MyWidgets().caixaTexto(
                  'Quantidade de leite diário(Litros)', milkProducedCon),
              MyWidgets()
                  .caixaTexto('Periodo de lactação(dias)', lactationPeriodCon),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 25.0, left: 20.0, top: 30.0),
                    child: MyWidgets().button(
                        'Excluir', 100, 40, 15, Colors.redAccent[700], () {
                      cattleController.deleteCattle(cattleController.cattleId).then((resposta) => validateDelete(resposta));
                    }),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 30.0),
                      child: MyWidgets().button(
                          'Salvar', 100, 40, 15, Colors.greenAccent[700], () {
                        setState(() {
                          if (creationTypeCon.text == '1')
                            _creationType = 'GADO_LEITEIRO';
                          else if (creationTypeCon.text == '2')
                            _creationType = 'GADO_CORTE';
                          else
                            _creationType = null;
                          _cattleName = nameCon.text;
                          _birthDate = setDate(birthDateCon.text);
                          if (sexCon.text == '1')
                            _sex = 'MALE';
                          else if (sexCon.text == '2')
                            _sex = 'FEMALE';
                          else
                            _sex = null;
                          _weight = weightCon.text;
                          _lactationPeriod = lactationPeriodCon.text;
                          _milkProduced = milkProducedCon.text;
                        });
                        updateCattle();
                      })),
                ],
              )
            ],
          ),
        ));
  }

  bool isEmpty() {
    String text = "";
    bool empty = false;
    setState(() {
      _creationType == null
          ? _wrongCreationType = text
          : _wrongCreationType = null;
      _cattleName.isEmpty ? _wrongName = text : _wrongName = null;
      _birthDate == null ? _wrongBirthDate = text : _wrongBirthDate = null;
      _sex == null ? _wrongSex = text : _wrongSex = null;
    });
    if (_creationType == null ||
        _cattleName.isEmpty ||
        _birthDate == null ||
        _sex == null) {
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
          "Bovino atualizado com sucesso.",
          onPressed: () async {
            await cattleController.getCattles();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeFarm()));
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
          "Bovino deletado com sucesso.",
          onPressed: () async {
            await cattleController.getCattles();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CattlesScreen()));
          },
        ),
      );
    }
}
