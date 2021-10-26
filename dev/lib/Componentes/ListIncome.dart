
import 'package:dev/Screens/ConfigFinancial.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

Widget buildListIncome(BuildContext context, int index, String financeType,
    String description, String value, String date, int incomeId) {
  return Container(
    height: 70,
    decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.black, width: 1.0),
            bottom: BorderSide(color: Colors.black, width: 1.0))),
    child: Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (financeType == 'LUCRO')
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.01),
              child: Icon(Icons.keyboard_arrow_up_outlined,
                  color: Colors.green, size: 40),
            )
          else if (financeType == 'DESPESA')
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.01),
              child: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.red,
                size: 40,
              ),
            ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.06),
              child: Text("$description"),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.06),
            child: Text("R\$ $value"),
          ),
          IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () async {
                await incomeController.getIncomeById(incomeId);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConfigFinancial()));
                // } else
                //   MyWidgets().logout(context, resposta);
              })
        ],
      ),
    ),
  );
}
