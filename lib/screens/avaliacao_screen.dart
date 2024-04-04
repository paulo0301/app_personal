import 'package:flutter/material.dart';

class AvaliacoesFisica extends StatefulWidget {
  const AvaliacoesFisica({super.key});

  @override
  State<AvaliacoesFisica> createState() => _AvaliacoesFisicaState();
}

class _AvaliacoesFisicaState extends State<AvaliacoesFisica> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Avaliações Fisicas"),
          ],
        ),
      ),
    );
  }
}
