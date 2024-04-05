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
}
