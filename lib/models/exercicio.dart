import 'package:flutter/material.dart';

class Exercicio {
  String id;
  String titulo;
  int series;
  int repeticoes;
  String? execucao;
  String descricao;
  String grupoMuscular;

  Exercicio(
      {required this.id,
      required this.titulo,
      required this.series,
      required this.repeticoes,
      required this.descricao,
      required this.grupoMuscular,
      this.execucao});
}
