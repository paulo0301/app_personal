import 'package:app_personal/models/aluno.dart';
import 'package:app_personal/models/treino.dart';

class FichaDeTreino {
  final String id;
  late final Aluno aluno;
  List<Treino> treinos = [];

  FichaDeTreino({
    required this.id,
  });

  void adicionarTreino(Treino treino) {
    this.treinos.add(treino);
  }

  factory FichaDeTreino.fromJson(Map<String, dynamic> json) {
    return FichaDeTreino(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson(Aluno aluno) {
    return {
      'id': id,
      'aluno': aluno.id,
      'treinos': treinos.map((treino) => treino.toJson()).toList()
    };
  }
}
