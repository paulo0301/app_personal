import 'package:app_personal/models/avaliacao_fisica.dart';
import 'package:app_personal/screens/dados_avaliacao_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class cardAvalicaoFisica extends StatefulWidget {
  AvaliacaoFisica avaliacaoFisica;
  int index;
  cardAvalicaoFisica({required this.avaliacaoFisica, required this.index});

  @override
  State<cardAvalicaoFisica> createState() => _cardAvalicaoFisicaState();
}

class _cardAvalicaoFisicaState extends State<cardAvalicaoFisica> {
  _avaliacaoDetails(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>
                DadosAvaliacao(avaliacaoFisica: widget.avaliacaoFisica)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => {_avaliacaoDetails(context)},
        leading: Icon(Icons.fitness_center_outlined),
        title: Text("Avalicação ${widget.index}"),
        subtitle: Text(
            "Data de realização: ${DateFormat("dd/mm/yyyy").format(widget.avaliacaoFisica.data)}"),
      ),
    );
  }
}
