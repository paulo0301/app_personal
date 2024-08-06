import 'package:app_personal/models/aluno.dart';
import 'package:app_personal/models/treino.dart';

class FichaDeTreino {
  int id;
  final int alunoId;
  String titulo;
  List<Treino> treinos = [];

  FichaDeTreino({required this.id, required this.alunoId, required this.titulo});

  void adicionarTreino(Treino treino) {
    this.treinos.add(treino);
  }

 factory FichaDeTreino.fromJson(Map<String, dynamic> json) {
    return FichaDeTreino(
      id: json['id'] as int,
      titulo: json['titulo'] as String,
      alunoId: (json['aluno'] as int?) ?? 0, // Ajuste para tratar valor nulo e garantir que é um int
    );
  }

  Map<String, dynamic> toJson(int id) {
    return {
      'id': id,
      'aluno_id': alunoId ?? 0,
      'titulo':titulo,
      'treinos': treinos.map((treino) => treino.toJson()).toList()
    };
  }
}
