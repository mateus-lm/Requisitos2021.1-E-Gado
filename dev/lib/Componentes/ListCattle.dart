import 'package:dev/Screens/ConfigCattle.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

Widget buildListCattles(
    BuildContext context, int index, String name, int cattleId) {
  return Container(
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
                await cattleController.getCattleById(cattleId);
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConfigCattle()));
                // } else
                //   MyWidgets().logout(context, resposta);
              })
        ],
      ),
    ),
  );
}
