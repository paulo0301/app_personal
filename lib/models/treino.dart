import 'package:app_personal/models/exercicio.dart';

class Treino {
  final String id;
  final String titulo;
  final String grupoMuscular;
  List<Exercicio> exercicios;

  Treino(
      {required this.id,
      required this.titulo,
      required this.exercicios,
      required this.grupoMuscular});
}
