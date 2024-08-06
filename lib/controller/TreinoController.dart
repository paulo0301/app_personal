import 'dart:convert';

import 'package:app_personal/models/treino.dart';
import 'package:http/http.dart' as http;

import '../models/exercicio.dart';

class TreinoController {
  TreinoController();

  static const String baseUrl = 'http://192.168.1.104:8080/personal/api/treino';

  static Future<Treino> addTreino(Treino treino) async {
    List<int> ids = [];
    treino.exercicios.map((exercicio) => ids.add(exercicio.id!));
    final response = await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'titulo': treino.titulo,
          'ficha_treino': treino.ficha_treino,
          'data_vencimento': treino.data_vencimento.toIso8601String(),
          'exercicios': ids
        }));

    if (response.statusCode == 200) {
      return Treino.fromJson(jsonDecode(response.body));
    }
    throw Exception("Não foi possível salvar o treino");
  }

  static Future<List<Treino>> getTreino(int id) async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jbody = jsonDecode(response.body);
      List<Treino> treinos =
          jbody.map((treino) => Treino.fromJson(treino)).toList();
      List<Treino> treinos_aluno =
          treinos.where((treino) => treino.id == id).toList();
      return treinos_aluno;
    }

    throw Exception("Não foi possível retornar os treinos do alunos");
  }
}
