import 'dart:math';

import 'package:app_personal/models/aluno.dart';
import 'package:app_personal/models/ficha_treino.dart';
import 'package:app_personal/screens/home_screen.dart';
import 'package:app_personal/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage(
    title: 'Personal Life',
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Life",
      theme: ThemeData(
        primaryColor: Colors.green,
        primaryColorLight: Colors.green,
        primaryColorDark: Colors.amber,
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStatePropertyAll(Colors.white),
          ),
        ),
      ),
      initialRoute: "/",
      routes: {
        AppRoutes.HOME: (ctx) => HomePage(),
      },
    );
  }
}
