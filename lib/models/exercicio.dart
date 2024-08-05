import 'package:flutter/material.dart';

class Exercicio {
  String id;
  String nome;
  int series;
  int repeticoes;
  //String? execucao;
  String observacoes;
  //String grupoMuscular;

  Exercicio(
      {required this.id,
      required this.nome,
      required this.series,
      required this.repeticoes,
      required this.observacoes});
  //required this.grupoMuscular,
  //this.execucao});

  factory Exercicio.fromJson(Map<String, dynamic> json) {
    return Exercicio(
        id: json['id'],
        nome: json['nome'],
        series: json['series'],
        repeticoes: json['repeticoes'],
        observacoes: json['descricao']);
    //grupoMuscular: json['grupoMuscular']);
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'series': series,
      'repeticoes': repeticoes,
      //'execucao': execucao != null ? execucao : '',
      'observacoes': observacoes,
      //'grupoMuscular': grupoMuscular,
    };
  }
}
