import 'package:app_personal/models/avaliacao_fisica.dart';

class Aluno {
  final String id;
  String nome;
  String email;
  DateTime dataNascimento;
  List<AvaliacaoFisica> avaliacoesFisicas;

  Aluno({
    required this.id,
    required this.nome,
    required this.email,
    required this.dataNascimento,
    this.avaliacoesFisicas = const [],
  });
}
