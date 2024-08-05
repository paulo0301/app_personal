// ignore_for_file: unnecessary_new

import 'dart:async';
import 'dart:convert';

import '../models/exercicio.dart';
import 'package:http/http.dart' as http;

class ExercicioController {
  ExercicioController();

  static const String baseUrl = 'http://localhost:8080/personal/api/exercicio';

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
            id: value['id'],
            nome: value['nome'],
            series: value['series'],
            repeticoes: value['repeticoes'],
            observacoes: value['observacoes']);
        //grupoMuscular: value['grupoMuscular']);

        exercicios.add(exercicio);
      });

      return exercicios;
    }

    throw Exception("Erro não foi possível retornar a lista de exercícios!");
  }

  static Future<Exercicio> updateExercicio(Exercicio exercicio) async {
    String id = exercicio.id;
    final response = await http.put(Uri.parse('${baseUrl}/$id'),
        body: jsonEncode(<String, dynamic>{
          'nome': exercicio.nome,
          'series': exercicio.series,
          'repeticoes': exercicio.repeticoes,
          //'execucao': exercicio.execucao != null ? exercicio.execucao : '',
          'observacoes': exercicio.observacoes,
          //'grupoMuscular': exercicio.grupoMuscular,
        }));

    if (response.statusCode == 200) {
      return Exercicio.fromJson(jsonDecode(response.body));
    }

    throw Exception("Erro não foi possível atualizar o exercício!");
  }

  static Future<Exercicio> deleteExercicio(String id) async {
    final response = await http.delete(Uri.parse('${baseUrl}/$id'));

    if (response.statusCode == 200) {
      return Exercicio.fromJson(jsonDecode(response.body));
    }

    throw Exception("Erro não foi possível deletar o exercício!");
  }
}
