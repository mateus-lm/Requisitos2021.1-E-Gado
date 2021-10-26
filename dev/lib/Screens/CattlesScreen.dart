import 'package:dev/globals.dart';
import 'package:flutter/material.dart';
import '../Componentes/ListCattle.dart';
import '../Componentes/MyWidgets.dart';
import 'addBovino.dart';

class CattlesScreen extends StatefulWidget {
  @override
  _CattlesScreenState createState() => _CattlesScreenState();
}

class _CattlesScreenState extends State<CattlesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(right: 30),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
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
              child: Text(
                farmController.farmName,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Roboto',
                  fontSize: 15,
                ),
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
        physics: ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.add, size: 30),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 40, 30, 40),
                      child: Text(
                        "Adicionar Bovino",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddBovino()));
                },
              ),
            ),
            FutureBuilder(
                future: cattleController.getListCattles(),
                builder: (context, projectSnap) {
                  if (projectSnap.hasError) {
                    return Text("Something went wrong");
                  } else if (projectSnap.connectionState ==
                      ConnectionState.done) {
                    print('ProjectSnap ${projectSnap.data.length}');
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: projectSnap.data.length,
                        itemBuilder: (context, i) {
                          List cattles = projectSnap.data; 
                          return buildListCattles(context, i,
                              cattles[i]['id_cattle'], cattles[i]['id']);
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })
          ],
        ),
      ),
    );
  }
}
