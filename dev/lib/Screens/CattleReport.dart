import 'package:dev/Componentes/MyWidgets.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

class CattleReport extends StatefulWidget {
  @override
  _CattleReportState createState() => _CattleReportState();
}

class _CattleReportState extends State<CattleReport> {
  double propLeiteiro = 0;
  double propCorte = 0;
  double propMaleL = 0;
  double propFemaleL = 0;
  double propMaleC = 0;
  double propFemaleC = 0;
  @override
  void initState() {
    super.initState();
    // 1a
    int leiteiro = cattleController.contLeiteiro;
    int corte = cattleController.contCorte;

    if (leiteiro != 0 && corte != 0) {
      propLeiteiro = leiteiro / corte;
      propCorte = corte / leiteiro;
    } else if (leiteiro == 0) {
      propLeiteiro = 0.01;
      propCorte = 1;
    } else if (corte == 0) {
      propLeiteiro = 1;
      propCorte = 0.01;
    }

    if (propLeiteiro < propCorte) {
      propLeiteiro = propLeiteiro;
      propCorte = 1;
    } else {
      propCorte = propCorte;
      propLeiteiro = 1;
    }

    //2a
    int maleL = cattleController.contMaleL;
    int femaleL = cattleController.contFemaleL;

    if (maleL != 0 && femaleL != 0) {
      propMaleL = maleL / femaleL;
      propFemaleL = femaleL / maleL;
    } else if (maleL == 0) {
      propMaleL = 0.01;
      propFemaleL = 1;
    } else if (femaleL == 0) {
      propMaleL = 1;
      propFemaleL = 0.01;
    }

    if (propMaleL < propFemaleL) {
      propMaleL = propMaleL;
      propFemaleL = 1;
    } else {
      propFemaleL = propFemaleL;
      propMaleL = 1;
    }

    //3a
    int maleC = cattleController.contMaleC;
    int femaleC = cattleController.contFemaleC;

    if (maleC != 0 && femaleC != 0) {
      propMaleC = maleC / femaleC;
      propFemaleC = femaleC / maleC;
    } else if (maleC == 0) {
      propMaleC = 0.01;
      propFemaleC = 1;
    } else if (femaleC == 0) {
      propMaleC = 1;
      propFemaleC = 0.01;
    }

    if (propMaleC < propFemaleC) {
      propMaleC = propMaleC;
      propFemaleC = 1;
    } else {
      propFemaleC = propFemaleC;
      propMaleC = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: Color.fromRGBO(0, 0, 0, 1),
        centerTitle: true,
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
          Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Text(
                'Relatório Geral',
                style: TextStyle(fontSize: 20),
              )),
          Container(
            // alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.teal[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                      bottom: MediaQuery.of(context).size.height * 0.05),
                  child: Text(
                    'Quantidade total de Bovinos: ${cattleController.contTotal}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.006),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.35,
                            right: MediaQuery.of(context).size.width * 0.055),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          color: Colors.black,
                          height: MediaQuery.of(context).size.height *
                              0.07 *
                              propLeiteiro,
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height *
                            0.07 *
                            propCorte,
                        width: MediaQuery.of(context).size.width * 0.08,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.33,
                          right: MediaQuery.of(context).size.width * 0.023),
                      child: Text('Leiteiro'),
                    ),
                    Text('Corte'),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.43,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.teal[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                        bottom: MediaQuery.of(context).size.height * 0.03,
                      ),
                      child: Text(
                        'Gado leiteiro: ${cattleController.contLeiteiro}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.006),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.11,
                                right:
                                    MediaQuery.of(context).size.width * 0.055),
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.black,
                              height: MediaQuery.of(context).size.height *
                                  0.05 *
                                  propMaleL,
                              width: MediaQuery.of(context).size.width * 0.08,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height *
                                0.05 *
                                propFemaleL,
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.09,
                              right: MediaQuery.of(context).size.width * 0.023),
                          child: Text('Macho'),
                        ),
                        Text('Femea'),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.43,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.teal[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          bottom: MediaQuery.of(context).size.height * 0.03),
                      child: Text(
                        'Gado de Corte: ${cattleController.contCorte} ',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.006),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.11,
                                right:
                                    MediaQuery.of(context).size.width * 0.055),
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.black,
                              height: MediaQuery.of(context).size.height *
                                  0.05 *
                                  propMaleC,
                              width: MediaQuery.of(context).size.width * 0.08,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height *
                                0.05 *
                                propFemaleC,
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.09,
                              right: MediaQuery.of(context).size.width * 0.023),
                          child: Text('Macho'),
                        ),
                        Text('Femea'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.43,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.teal[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.04,
                              right: MediaQuery.of(context).size.width * 0.04,
                              top: MediaQuery.of(context).size.height * 0.02 ),
                        child: Text(
                            'Média de leite produzido por dia (Em Litros): ${cattleController.qtdMilk/cattleController.contLeiteiro}'))
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.43,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.teal[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.04,
                              right: MediaQuery.of(context).size.width * 0.04,
                              top: MediaQuery.of(context).size.height * 0.02 ),
                        child: Text(
                            'Quantidade de leite produzido por dia (Em Litros): ${cattleController.qtdMilk}'))
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.teal[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text('Relatório Financeiro ultimo mês',
                      style: TextStyle(fontSize: 16)),
                ),
                Row(children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text(
                        'Lucro: R\$${incomeController.profit.toString()}',
                        style: TextStyle(fontSize: 16)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.45,
                    alignment: Alignment.center,
                    child: Text('Despesa: R\$${incomeController.expense}',
                        style: TextStyle(fontSize: 16)),
                  )
                ]),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width,
                  child: Text('Total: R\$${incomeController.totalValue}',
                      style: TextStyle(fontSize: 16)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//   _criarLinhaTable(String listaNomes) {
//     return TableRow(
//       children: listaNomes.split(',').map((name) {
//         return Container(
//           alignment: Alignment.center,
//           child: Text(
//             name,
//             style: TextStyle(fontSize: 20.0),
//           ),
//           padding: EdgeInsets.all(8.0),
//         );
//       }).toList(),
//     );
//   }
// }

Widget buildNumber(String number) => Container(
      padding: EdgeInsets.all(16),
      color: Colors.orange,
      child: GridTile(
        header: Text(
          'Header $number',
          textAlign: TextAlign.center,
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
            textAlign: TextAlign.center,
          ),
        ),
        footer: Text(
          'Footer $number',
          textAlign: TextAlign.center,
        ),
      ),
    );
