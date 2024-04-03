import 'package:app_personal/models/aluno.dart';
import 'package:app_personal/models/treino.dart';

class FichaDeTreino {
  final String id;
  final String titulo;
  final Aluno aluno;
  final List<Treino> treinos = [];

  FichaDeTreino({
    required this.id,
    required this.titulo,
    required this.aluno,
  });
}
