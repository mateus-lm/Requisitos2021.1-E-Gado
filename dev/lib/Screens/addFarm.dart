import 'package:dev/Componentes/MyWidgets.dart';
import 'package:dev/globals.dart';
import 'package:flutter/material.dart';

class AddFarm extends StatefulWidget {
  @override
  _AddFarmState createState() => _AddFarmState();
}

class _AddFarmState extends State<AddFarm> {
  final farmNameCon = new TextEditingController();
  final farmCityCon = new TextEditingController();
  final farmStateCon = new TextEditingController();
  final farmSizeCon = new TextEditingController();

  var _farmName;
  var _farmCity;
  var _farmState;
  var _farmSize;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 5,
            shadowColor: Color.fromRGBO(0, 0, 0, 1),
            centerTitle: true,
            title: Text(
              'Cadastrar fazenda',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
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
                      padding: EdgeInsets.only(bottom: 20.0),
                      alignment: Alignment.center,
                      child: Image(
                        image: AssetImage('assets/images/farm_icon.png'),
                        width: 125,
                        height: 125,
                      )),
                  MyWidgets().caixaTexto('Nome da Fazenda', farmNameCon),
                  MyWidgets().caixaTexto('Cidade', farmCityCon),
                  MyWidgets().caixaTexto('Estado', farmStateCon),
                  MyWidgets().caixaTexto('Tamanho em hectares', farmSizeCon),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 25.0, left: 20.0, top: 15.0),
                        child: MyWidgets().button('Cancelar', 100, 40, 15,
                            Colors.redAccent[700], () {Navigator.pop(context);}),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 15.0),
                        child: MyWidgets().button(
                            'Salvar', 100, 40, 15, Colors.greenAccent[700],
                            () async {
                          setState(() {
                            _farmName = farmNameCon.text;
                            _farmCity = farmCityCon.text;
                            _farmState = farmStateCon.text;
                            _farmSize = farmSizeCon.text;
                          });

                          await farmController.postFarm(
                              _farmName, _farmCity, _farmState, _farmSize);
                          // List farmsList = await farmController.getFarms();
                          // await farmController
                          //     .getFarmById(farmsList[farmsList.length - 1]['id']);
                          Navigator.of(context).pushReplacementNamed('/farmsScreen');
                        }),
                      )
                    ],
                  )
                ],
              ))),
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text('Aviso'),
          content: Text('Deseja Realmente retornar a tela anterior?'),
          actions: [
            TextButton(
                child: Text('Sim'),
                onPressed: () {
                  Navigator.pop(c, false);
                  Navigator.of(context).pushReplacementNamed('/farmsScreen');
                }),
            TextButton(
              child: Text('Não'),
              onPressed: () => Navigator.pop(c, false),
            ),
          ],
        ),
      ),
    );
  }
}
