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

  factory Exercicio.fromJson(Map<String, dynamic> json) {
    return Exercicio(
        id: json['id'],
        titulo: json['titulo'],
        series: json['series'],
        repeticoes: json['repeticoes'],
        descricao: json['descricao'],
        grupoMuscular: json['grupoMuscular']);
  }

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'series': series,
      'repeticoes': repeticoes,
      'execucao': execucao != null ? execucao : '',
      'descricao': descricao,
      'grupoMuscular': grupoMuscular,
    };
  }
}
