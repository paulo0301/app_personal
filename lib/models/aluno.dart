import 'package:app_personal/models/avaliacao_fisica.dart';
import 'package:app_personal/models/ficha_treino.dart';

class Aluno {
  final String id;
  String nome;
  String email;
  DateTime dataNascimento;
  List<AvaliacaoFisica> avaliacoesFisicas = [];
  late FichaDeTreino fichaTreino;

  Aluno({
    required this.id,
    required this.nome,
    required this.email,
    required this.dataNascimento,
    required this.fichaTreino,
  });

  void adicionarAvalicao(AvaliacaoFisica avaliacaoFisica) {
    this.avaliacoesFisicas.add(avaliacaoFisica);
  }

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
        id: json['id'],
        nome: json['nome'],
        email: json['email'],
        dataNascimento: json['dataNascimento'],
        fichaTreino: json['fichaTreino']);
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'dataNascimento': dataNascimento.toIso8601String(),
      'avaliacoesFisicas':
          avaliacoesFisicas.map((avaliacao) => avaliacao.toJson()).toList(),
      'fichaTreino':
          fichaTreino.toJson(this), // Convertendo FichaDeTreino para JSON
    };
  }
}
