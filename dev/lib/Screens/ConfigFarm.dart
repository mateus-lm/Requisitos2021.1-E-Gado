import 'package:dev/Componentes/MyWidgets.dart';
import 'package:flutter/material.dart';
import '../globals.dart';

class ConfigFarm extends StatefulWidget {
  @override
  _ConfigFarmState createState() => _ConfigFarmState();
}

class _ConfigFarmState extends State<ConfigFarm> {
  final farmNameCon = new TextEditingController();
  final farmCityCon = new TextEditingController();
  final farmStateCon = new TextEditingController();
  final farmSizeCon = new TextEditingController();

  String _wrongName;
  String _wrongCity;
  String _wrongState;
  String _wrongSize;
  bool _error = false;

  var _farmName;
  var _farmCity;
  var _farmState;
  var _farmSize;

  void updateFarm() {
    if (isEmpty() == false) {
      _error = false;
      print("deu bom");
      farmController
          .updateFarm(_farmName, _farmCity, _farmState, _farmSize,
              farmController.farmId)
          .then((resposta) => validate(resposta));
    } else {
      _error = true;
      print("OLÁ");
    }
  }

  @override
  void initState() {
    super.initState();

    farmNameCon.text = farmController.farmName;
    farmCityCon.text = farmController.farmCity;
    farmStateCon.text = farmController.farmState;
    farmSizeCon.text = farmController.farmTam;
  }

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
                    Navigator.of(context).pushReplacementNamed('/farmsScreen');
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
                  ErrorText(_error),
                  MyWidgets().caixaTexto('Nome da Fazenda', farmNameCon,
                      errorText: _wrongName),
                  MyWidgets()
                      .caixaTexto('Cidade', farmCityCon, errorText: _wrongCity),
                  MyWidgets().caixaTexto('Estado', farmStateCon,
                      errorText: _wrongState),
                  MyWidgets().caixaTexto('Tamanho em hectares', farmSizeCon,
                      errorText: _wrongSize),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 25.0, left: 20.0, top: 15.0),
                        child: MyWidgets().button(
                            'Excluir', 100, 40, 15, Colors.redAccent, () {
                          farmController
                              .deleteFarm(farmController.farmId)
                              .then((resposta) => validateDelete(resposta));
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 15.0),
                        child: MyWidgets()
                            .button('Salvar', 100, 40, 15, Colors.greenAccent,
                                () async {
                          setState(() {
                            _farmName = farmNameCon.text;
                            _farmCity = farmCityCon.text;
                            _farmState = farmStateCon.text;
                            _farmSize = farmSizeCon.text;
                          });
                          updateFarm();
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
                  Navigator.of(context)
                      .pushReplacementNamed('/farmsScreen');
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

  bool isEmpty() {
    String text = "";
    bool empty = false;
    setState(() {
      _farmName.isEmpty ? _wrongName = text : _wrongName = null;
      _farmCity.isEmpty ? _wrongCity = text : _wrongCity = null;
      _farmState.isEmpty ? _wrongState = text : _wrongState = null;
      _farmSize.isEmpty ? _wrongSize = text : _wrongSize = null;
    });
    if (_farmName.isEmpty ||
        _farmCity.isEmpty ||
        _farmState.isEmpty ||
        _farmSize.isEmpty) {
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
                "Fazenda atualizada com sucesso.",
                onPressed: () {
                  // await farmController.getFarmById(farmController.farmId);
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('/farmsScreen');
                },
              ));
    } else {
      print("ruim");
    }
  }

  void validateDelete(bool resposta) async {
    List farms = await farmController.getFarms();
    if (farms.length == 0) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) =>
            PopUpAlertDialog("Você excluiu todas as fazendas", onPressed: () {
          Navigator.pop(context);
          Navigator.of(context).pushReplacementNamed('/farmsScreen');
        }),
      );
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => PopUpAlertDialog(
          "Fazenda deletada com sucesso.",
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/farmsScreen');
          },
        ),
      );
    }
  }
}
