import 'package:app_personal/models/exercicio.dart';

class Treino {
  final String id;
  final String titulo;
  List<Exercicio> exercicios = [];

  Treino({
    required this.id,
    required this.titulo,
  });
}
