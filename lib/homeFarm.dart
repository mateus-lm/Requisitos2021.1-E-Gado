import 'package:dev/Componentes/MyWidgets.dart';
import 'package:dev/addBovino.dart';
import 'package:dev/loginScreen.dart';
import 'package:flutter/material.dart';

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
        title: Text(
          'Fazenda Backend',
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
                  MaterialPageRoute(builder: (context) => AddBovino()));
            })
          ],
        ),
      ),
    );
  }
}
