import 'package:flutter/material.dart';

class FichaTreino extends StatefulWidget {
  const FichaTreino({super.key});

  @override
  State<FichaTreino> createState() => _FichaTreinoState();
}

class _FichaTreinoState extends State<FichaTreino> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ficha de Treino"),
          ],
        ),
      ),
    );
  }
}
