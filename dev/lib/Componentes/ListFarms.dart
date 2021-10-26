import 'package:dev/Screens/ConfigFarm.dart';
import 'package:dev/Screens/homeFarm.dart';
import 'package:flutter/material.dart';

import '../globals.dart';



Widget buildListFarms(
    BuildContext context, int index, String name, int farmId) {
        
  return GestureDetector(
    onTap: () async {
      // await _storage.write(key: 'profileIndex', value: index.toString());
      // bool resposta = await userController.checkToken();
      // if (resposta) {
        await farmController.getFarmById(farmId);
        incomeController.changeExpense(0);
        incomeController.changeProfit(0);
        incomeController.changeTotalValue(0);
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeFarm()));
      // } else
      //   MyWidgets().logout(context, resposta);
    },
    child: Container(
      height: 70,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.black, width: 1.0),
              bottom: BorderSide(color: Colors.black, width: 1.0))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage("assets/images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("$name"),
              ),
            ]),
            IconButton(
                icon: const Icon(Icons.settings_outlined),
                onPressed: () async {
                  // bool resposta = await userController.checkToken();
                  // if (resposta) {
                  //   await _storage.write(
                  //       key: 'profileIndex', value: index.toString());
                    await farmController.getFarmById(farmId);
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ConfigFarm()));
                  // } else
                  //   MyWidgets().logout(context, resposta);
                })
          ],
        ),
      ),
    ),
  );
}
