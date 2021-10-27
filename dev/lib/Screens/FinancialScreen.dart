import 'package:dev/Componentes/ListIncome.dart';
import 'package:dev/Componentes/MyWidgets.dart';
import 'package:dev/Screens/AddFinancialReport.dart';
import 'package:dev/globals.dart';
import 'package:flutter/material.dart';
import '../Componentes/MyWidgets.dart';
import '../globals.dart';

class FinancialScreen extends StatefulWidget {
  @override
  _FinancialScreenState createState() => _FinancialScreenState();
}

class _FinancialScreenState extends State<FinancialScreen> {
  String expense = incomeController.expense.toString();
  String profit = incomeController.profit.toString();
  String valueTotal = incomeController.totalValue.toString();
  Future income = incomeController.getList(0);

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    //alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.add, size: 30),
                          Padding(
                            padding: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * 0.08),
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
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddFinancial()));
                        // userController
                        //     .checkToken()
                        //     .then((resposta) => createFarm(resposta));
                      },
                    ),
                  ),
                  FutureBuilder(
                      future: income,
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
                                  income[i]['id'],
                                );
                              });
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      })
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.24,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                  child: Text(
                    'Visualizar relatório do(s) último(s):',
                    style: TextStyle(color: Colors.black),
                  )),
              Row(children: [
                MyWidgets().button(
                    '1 mês',
                    MediaQuery.of(context).size.width * 0.25,
                    MediaQuery.of(context).size.height * 0.04,
                    10,
                    Colors.grey, () async {
                  await incomeController.getValuePerDay(1);
                  setState(() {
                    expense = incomeController.expense.toString();
                    profit = incomeController.profit.toString();
                    valueTotal = incomeController.totalValue.toString();
                    income = incomeController.getList(1);
                  });
                }),
                MyWidgets().button(
                    '3 meses',
                    MediaQuery.of(context).size.width * 0.25,
                    MediaQuery.of(context).size.height * 0.04,
                    10,
                    Colors.grey, () async {
                  await incomeController.getValuePerDay(2);
                  setState(() {
                    expense = incomeController.expense.toString();
                    profit = incomeController.profit.toString();
                    valueTotal = incomeController.totalValue.toString();
                    income = incomeController.getList(2);
                  });
                }),
                MyWidgets().button(
                    '6 meses',
                    MediaQuery.of(context).size.width * 0.25,
                    MediaQuery.of(context).size.height * 0.04,
                    10,
                    Colors.grey, () async {
                  await incomeController.getValuePerDay(3);
                  setState(() {
                    expense = incomeController.expense.toString();
                    profit = incomeController.profit.toString();
                    valueTotal = incomeController.totalValue.toString();
                    income = incomeController.getList(3);
                  });
                }),
                MyWidgets().button(
                    'Todos',
                    MediaQuery.of(context).size.width * 0.25,
                    MediaQuery.of(context).size.height * 0.04,
                    10,
                    Colors.grey, () async {
                  await incomeController.getValues();
                  setState(() {
                    expense = incomeController.expense.toString();
                    profit = incomeController.profit.toString();
                    valueTotal = incomeController.totalValue.toString();
                    income = incomeController.getList(0);
                  });
                }),
              ]),
              Row(children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        'Soma dos Lucros',
                        style: TextStyle(fontSize: 16),
                      )),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text('R\$$profit', style: TextStyle(fontSize: 16)),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border(
                          top: BorderSide(color: Colors.black, width: 1.0),
                          bottom: BorderSide(color: Colors.black, width: 1.0),
                        )),
                  )
                ]),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.5,
                      alignment: Alignment.center,
                      child: Text(
                        'Soma das Despesas',
                        style: TextStyle(fontSize: 16),
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red[800],
                        border: Border(
                          left: BorderSide(color: Colors.black, width: 1.0),
                          top: BorderSide(color: Colors.black, width: 1.0),
                          bottom: BorderSide(color: Colors.black, width: 1.0),
                        )),
                    child: Text('R\$$expense', style: TextStyle(fontSize: 16)),
                  )
                ])
              ]),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Text('Total: R\$$valueTotal',
                    style: TextStyle(fontSize: 16)),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
