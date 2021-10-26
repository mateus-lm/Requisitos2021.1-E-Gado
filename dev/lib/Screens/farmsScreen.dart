import 'package:dev/Componentes/ListFarms.dart';
import 'package:dev/Screens/addFarm.dart';
import 'package:dev/globals.dart';
import 'package:flutter/material.dart';

class FarmsScreen extends StatefulWidget {
  @override
  _FarmsScreenState createState() => _FarmsScreenState();
}

class _FarmsScreenState extends State<FarmsScreen> {
  @override

  // void createFarm(bool resposta) {
  //   if (resposta) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => AddFarm()));
  //   } else
  //     MyWidgets().logout(context, resposta);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Fazendas',
          style: TextStyle(color: Theme.of(context).primaryColor),
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
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddFarm()));
                  // userController
                  //     .checkToken()
                  //     .then((resposta) => createFarm(resposta));
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
