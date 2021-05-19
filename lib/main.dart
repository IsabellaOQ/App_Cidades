import 'package:flutter/material.dart';
import 'package:isabellaoliveira_rm83588/screens/detalhes.dart';
import 'package:isabellaoliveira_rm83588/screens/principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LocaisScreen(),
        '/detalhes': (context) => Detalhes(),
        '/principal': (context) => LocaisScreen(),
      },
      title: 'Turismo App',
    
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
    );
  }
}

/*
theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
*/
