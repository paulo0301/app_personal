import 'package:app_personal/models/aluno.dart';
import 'package:app_personal/models/treino.dart';

class FichaDeTreino {
  final String id;
  final String alunoId;
  List<Treino> treinos = [];

  FichaDeTreino({
    required this.id,
    required this.alunoId
  });

  void adicionarTreino(Treino treino) {
    this.treinos.add(treino);
  }

  factory FichaDeTreino.fromJson(Map<String, dynamic> json) {
    return FichaDeTreino(
      id: json['id'],
      alunoId: json['aluno_id'] ?? '', // Ajuste para tratar possível valor nulo
    );
  }

  Map<String, dynamic> toJson(String id) {
    return {
      'id': id,
      'aluno_id': alunoId?? '',
      'treinos': treinos.map((treino) => treino.toJson()).toList()
    };
  }
}
