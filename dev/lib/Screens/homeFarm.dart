import 'dart:io';

import 'package:dev/Componentes/MyWidgets.dart';
import 'package:dev/Screens/CattleReport.dart';
import 'package:dev/Screens/FinancialScreen.dart';
import './CattlesScreen.dart';
import 'package:dev/Screens/farmsScreen.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

class HomeFarm extends StatefulWidget {
  @override
  _HomeFarmState createState() => _HomeFarmState();
}

class _HomeFarmState extends State<HomeFarm> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 5,
          shadowColor: Color.fromRGBO(0, 0, 0, 1),
          title: Row(children: [
            Padding(
              padding: EdgeInsets.only(
                  right: 10, left: MediaQuery.of(context).size.width * 0.2),
              child: CircleAvatar(
                radius: 17.5,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  MyWidgets().splitName(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.2),
                child: Text(
                  farmController.farmName,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Roboto',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ]),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 50.0),
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage('assets/images/farm_icon.png'),
                    width: 125,
                    height: 125,
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.03),
                  child: MyWidgets().button(
                      'Bovinos',
                      MediaQuery.of(context).size.width * 0.8,
                      50.0,
                      15.0,
                      Theme.of(context).primaryColor, () async {
                    await cattleController.getCattles();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CattlesScreen()));
                  })),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.03),
                child: MyWidgets().button(
                    'Financeiro',
                    MediaQuery.of(context).size.width * 0.8,
                    50.0,
                    15.0,
                    Theme.of(context).primaryColor, () async {
                  await incomeController.getIncome();
                  await incomeController.getValues();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FinancialScreen()));
                }),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.03),
                child: MyWidgets().button(
                    'Fazendas',
                    MediaQuery.of(context).size.width * 0.8,
                    50.0,
                    15.0,
                    Theme.of(context).primaryColor, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FarmsScreen()));
                }),
              ),
              MyWidgets().button(
                  'Relatório de Bovinos',
                  MediaQuery.of(context).size.width * 0.8,
                  50.0,
                  15.0,
                  Theme.of(context).primaryColor, () async {
                await cattleController.getCattles();
                await cattleController.getListCattles();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CattleReport()));
              })
            ],
          ),
        ),
      ),
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text('Aviso'),
          content: Text('Realmente deseja sair do Aplicativo'),
          actions: [
            TextButton(
              child: Text('Sim'),
              onPressed: () => exit(0),
            ),
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
