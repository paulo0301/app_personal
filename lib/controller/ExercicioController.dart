import 'dart:async';
import 'dart:convert';

import '../models/exercicio.dart';
import 'package:http/http.dart' as http;

class ExercicioController {
  ExercicioController();

  static const String baseUrl =
      'https://personal-app-90b28-default-rtdb.firebaseio.com/exercicio.json';

  static Future<Exercicio> addExercicio(Exercicio exercicio) async {
    final response = await http.post(Uri.parse(baseUrl),
        body: jsonEncode(exercicio.toJson()));

    if (response.statusCode == 200) {
      return Exercicio.fromJson(jsonDecode(response.body));
    }

    throw Exception("Erro não foi possível salvar o exercício!");
  }

  static Future<List<Exercicio>> getExercicios() async {
    final response = await http.get(Uri.parse(baseUrl));

    List<Exercicio> exercicios = [];

    if (response.statusCode == 200) {
      final Map<String, dynamic> jbody = jsonDecode(response.body);
      jbody.forEach((key, value) {
        Exercicio exercicio = new Exercicio(
            id: key,
            titulo: value['titulo'],
            series: value['series'],
            repeticoes: value['repeticoes'],
            descricao: value['descricao'],
            grupoMuscular: value['grupoMuscular']);

        exercicios.add(exercicio);
      });

      return exercicios;
    }

    throw Exception("Erro não foi possível retornar a lista de exercícios!");
  }

  static Future<Exercicio> updateExercicio(Exercicio exercicio) async {
    String id = exercicio.id;
    final response = await http.put(
        Uri.parse(
            'https://personal-app-90b28-default-rtdb.firebaseio.com/exercicio/$id.json'),
        body: jsonEncode(<String, dynamic>{
          'titulo': exercicio.titulo,
          'series': exercicio.series,
          'repeticoes': exercicio.repeticoes,
          'execucao': exercicio.execucao != null ? exercicio.execucao : '',
          'descricao': exercicio.descricao,
          'grupoMuscular': exercicio.grupoMuscular,
        }));

    if (response.statusCode == 200) {
      return Exercicio.fromJson(jsonDecode(response.body));
    }

    throw Exception("Erro não foi possível atualizar o exercício!");
  }

  static Future<Exercicio> deleteExercicio(String id) async {
    final response = await http.delete(Uri.parse(
        'https://personal-app-90b28-default-rtdb.firebaseio.com/exercicio/$id.json'));

    if (response.statusCode == 200) {
      return Exercicio.fromJson(jsonDecode(response.body));
    }

    throw Exception("Erro não foi possível deletar o exercício!");
  }
}
