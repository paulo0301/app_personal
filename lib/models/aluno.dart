import 'dart:io';

import 'package:app_personal/models/avaliacao_fisica.dart';
import 'package:app_personal/models/ficha_treino.dart';

class Aluno {
  final int id;
  String nome;
  String email;
  DateTime dataNascimento;
  List<AvaliacaoFisica> avaliacoesFisicas = [];
  late FichaDeTreino fichaTreino;
  String? avatarPath;

  Aluno(
      {required this.id,
      required this.nome,
      required this.email,
      required this.dataNascimento,
      required this.fichaTreino,
      this.avatarPath});

  void adicionarAvalicao(AvaliacaoFisica avaliacaoFisica) {
    this.avaliacoesFisicas.add(avaliacaoFisica);
  }

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
        id: json['id'],
        nome: json['nome'],
        email: json['email'],
        dataNascimento: json['dataNascimento'],
        fichaTreino: json['fichaTreino'],
        avatarPath: json['avatarPath'] != null ? json['avatarPath'] : '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'nome': nome,
      'email': email,
      'dataNascimento': dataNascimento.toIso8601String(),
      'avaliacoesFisicas':
          avaliacoesFisicas.map((avaliacao) => avaliacao.toJson()).toList(),
      'fichaTreino': fichaTreino.toJson(this.id),
      'avatarPath': avatarPath ?? ''
    };
  }
}
