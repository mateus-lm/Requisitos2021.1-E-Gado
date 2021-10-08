import 'package:dev/Componentes/ListFarms.dart';
import 'package:dev/globals.dart';
import 'package:flutter/material.dart';

class FarmsScreen extends StatefulWidget {
  @override
  _FarmsScreenState createState() => _FarmsScreenState();
}

class _FarmsScreenState extends State<FarmsScreen> {
  @override
  List array = farmController.farmName.split(' ');
  String _nome = farmController.farmName;
  bool _isLoading = true;

  String splitName(List array) {
    String name;
    if (array.length > 1) {
      name = array[0].substring(0, 1).toUpperCase() +
          array[1].substring(0, 1).toUpperCase();
    } else {
      name = array[0].substring(0, 1).toUpperCase();
    }
    return name;
  }

  // void createProfile(bool resposta) {
  //   if (resposta) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => CreateProfile()));
  //   } else
  //     MyWidgets().logout(context, resposta);
  // }

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
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                'Fazendas',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Text(
              _nome,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
              ),
            ),
          ]),
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //alignment: Alignment.centerRight,
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.add, size: 30),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 40, 30, 40),
                      child: Text(
                        "Adicionar Fazenda",
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
                  print('Adicionar');
                  // userController
                  //     .checkToken()
                  //     .then((resposta) => createProfile(resposta));
                },
              ),
            ),
            FutureBuilder(
                future: farmController.getFarms(),
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
                          List farm = projectSnap.data;
                          return buildListFarms(
                              context, i, farm[i]['name_farm'], farm[i]['id']);
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
