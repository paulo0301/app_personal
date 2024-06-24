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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'grupoMuscular': grupoMuscular,
      'exercicos': exercicios.map((exercicio) => exercicio.toJson()).toList()
    };
  }
}
