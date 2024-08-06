import 'package:app_personal/models/exercicio.dart';

class Treino {
  final int id;
  final int ficha_treino;
  final String titulo;
  final DateTime data_vencimento;
  List<Exercicio> exercicios;

  Treino(
      {required this.id,
      required this.ficha_treino,
      required this.data_vencimento,
      required this.titulo,
      required this.exercicios});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'ficha_treino': ficha_treino,
      'data_vencimento': data_vencimento.toIso8601String(),
      'exercicios': exercicios.map((exercicio) => exercicio.toJson()).toList()
    };
  }

  factory Treino.fromJson(Map<String, dynamic> json) {
    return Treino(
      id: json['id'],
      titulo: json['titulo'],
      ficha_treino: json['ficha_treino'],
      data_vencimento: DateTime.parse(
          json['data_vencimento']), // Convert ISO 8601 string to DateTime
      exercicios: (json['exercicios'] as List<dynamic>)
          .map((item) => Exercicio.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
