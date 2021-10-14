import 'package:dev/Componentes/MyWidgets.dart';
import 'package:dev/Screens/AddFinancialReport.dart';
import 'package:dev/Screens/addBovino.dart';
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
                padding: const EdgeInsets.only(bottom: 25.0),
                child: MyWidgets().button(
                    'Bovinos',
                    MediaQuery.of(context).size.width * 0.8,
                    50.0,
                    15.0,
                    Theme.of(context).primaryColor, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddBovino()));
                })),
            MyWidgets().button(
                'Financeiro',
                MediaQuery.of(context).size.width * 0.8,
                50.0,
                15.0,
                Theme.of(context).primaryColor, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddFinancial()));
            }),
            MyWidgets().button(
                'Fazendas',
                MediaQuery.of(context).size.width * 0.8,
                50.0,
                15.0,
                Theme.of(context).primaryColor, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FarmsScreen()));
            })
          ],
        ),
      ),
    );
  }
}
