import 'package:flutter/material.dart';

class Exercicio {
  final String id;
  final String titulo;
  final int series;
  final int repeticoes;
  final String? execucao;
  final String descricao;
  final String grupoMuscular;

  Exercicio(
      {required this.id,
      required this.titulo,
      required this.series,
      required this.repeticoes,
      required this.descricao,
      required this.grupoMuscular,
      this.execucao});
}
