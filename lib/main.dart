import 'package:app_personal/models/alimento.store.dart';
import 'package:app_personal/models/suplemento.store.dart';
import 'package:app_personal/screens/alimentos_screen.dart';
import 'package:app_personal/screens/exercicios_screen.dart';
import 'package:app_personal/screens/home_screen.dart';
import 'package:app_personal/screens/suplementos_screen.dart';
import 'package:app_personal/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        Provider<SuplementoModelX>(create: (context) => SuplementoModelX()),
        Provider<AlimentoModelX>(create: (context) => AlimentoModelX())
      ],
      child: MaterialApp(
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
          AppRoutes.EXERCICIOS: (ctx) => ExerciciosPage(),
          AppRoutes.SUPLEMENTOS: (ctx) => SuplementosPage(),
          AppRoutes.ALIMENTOS: (ctx) => AlimentosPage()
        },
      ),
    );
  }
}
