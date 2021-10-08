import 'package:dev/Componentes/MyWidgets.dart';
import 'package:dev/Screens/loginScreen.dart';
import 'package:flutter/material.dart';

class AddBovino extends StatefulWidget {
  @override
  _AddBovinoState createState() => _AddBovinoState();
}

class _AddBovinoState extends State<AddBovino> {
  final creationTypeCon = new TextEditingController();
  final idCon = new TextEditingController();
  final sexCon = new TextEditingController();
  final birthDateCon = new TextEditingController();
  final weightCon = new TextEditingController();
  final milkProducedCon = new TextEditingController();
  final lactationPeriodCon = new TextEditingController();

  var _creationType;
  var _id;
  var _sex;
  var _birthDate;
  var _weight;
  var _lactationPeriod;
  var _milkProduced;


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
                color: Colors.black ,
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
                  onPressed: () {
                    setState(() {
                      if (creationTypeCon.text == '1')
                        _creationType = 'Leiteiro';
                      else if (creationTypeCon.text == '2')
                        _creationType = 'Corte';
                      else
                        _creationType = null;
                      _id = idCon.text;
                      _birthDate = birthDateCon.text;
                      sexCon.text == '1'
                          ? _sex = 'Masculino'
                          : _sex = 'Feminino';
                      _weight = weightCon.text;
                      _lactationPeriod = lactationPeriodCon.text;
                      _milkProduced = milkProducedCon.text;
                    });

                    print(_creationType);
                    print(_birthDate);
                    print(_sex);
                    print(_weight);
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
              DropDownCreate(creationTypeCon, 'Leiteiro', 'Corte',),
              MyWidgets()
                  .caixaTexto('Identificação:', idCon),
              GenderPicker(sexCon),
              DatePick(birthDateCon, "Data de Nascimento"),
              MyWidgets().caixaTexto('Peso', weightCon),
              MyWidgets()
                  .caixaTexto('Quantidade de leite diário', milkProducedCon),
              MyWidgets().caixaTexto('Periodo de lactação', lactationPeriodCon),
            ],
          ),
        ));
  }

  // bool isEmpty() {
  //   String text = "";
  //   bool empty = false;
  //   setState(() {
  //     _creationType.isEmpty
  //         ? _wrongCreationType = text
  //         : _wrongCreationType = null;
  //     _id.isEmpty ? _wrongId = text : _wrongId = null;
  //     birthDateCon.text.isEmpty
  //         ? _wrongBirthDate = text
  //         : _wrongBirthDate = null;
  //     sexCon.text.isEmpty ? _wrongSex = text : _wrongSex = null;
  //   });
  //   if (_creationType.isEmpty |
  //       _id.isEmpty ||
  //       birthDateCon.text.isEmpty ||
  //       sexCon.text.isEmpty) {
  //     empty = true;
  //   }
  //   return empty;
  // }
}
