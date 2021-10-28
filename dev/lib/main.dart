import 'package:flutter/material.dart';
import 'Screens/CattlesScreen.dart';
import 'Screens/FinancialScreen.dart';
import 'Screens/farmsScreen.dart';
import 'Screens/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/financialScreen': (BuildContext context) => new FinancialScreen(),
        '/cattlesScreen': (BuildContext context) => new CattlesScreen(),
        '/farmsScreen': (BuildContext context) => new FarmsScreen(),
      },
      home: LoginMenu(),
    );
  }
}
