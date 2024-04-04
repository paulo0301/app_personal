import 'package:app_personal/models/avaliacao_fisica.dart';
import 'package:app_personal/models/ficha_treino.dart';

class Aluno {
  final String id;
  String nome;
  String email;
  DateTime dataNascimento;
  List<AvaliacaoFisica> avaliacoesFisicas;
  late FichaDeTreino fichaTreino;

  Aluno({
    required this.id,
    required this.nome,
    required this.email,
    required this.dataNascimento,
    this.avaliacoesFisicas = const [],
    required this.fichaTreino,
  });
}
