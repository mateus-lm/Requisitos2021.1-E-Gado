import 'package:dev/Componentes/ListIncome.dart';
import 'package:dev/Componentes/MyWidgets.dart';
import 'package:dev/Screens/AddFinancialReport.dart';
import 'package:dev/globals.dart';
import 'package:flutter/material.dart';

class FinancialScreen extends StatefulWidget {
  @override
  _FinancialScreenState createState() => _FinancialScreenState();
}

class _FinancialScreenState extends State<FinancialScreen> {
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
                        "Adicionar Finança",
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddFinancial()));
                  // userController
                  //     .checkToken()
                  //     .then((resposta) => createFarm(resposta));
                },
              ),
            ),
            FutureBuilder(
                future: incomeController.getIncome(),
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
                          List income = projectSnap.data;
                          return buildListIncome(
                              context,
                              i,
                              income[i]['income_type'],
                              income[i]['description'],
                              income[i]['value'],
                              income[i]['date'],
                              income[i]['id']);
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
