// ignore_for_file: unnecessary_new

import 'dart:async';
import 'dart:convert';

import '../models/exercicio.dart';
import 'package:http/http.dart' as http;

class ExercicioController {
  ExercicioController();

  static const String baseUrl = 'http://192.168.1.104:8080/personal/api/exercicio';

  static Future<Exercicio> addExercicio(Exercicio exercicio) async {
    final response = await http.post(Uri.parse(baseUrl),
      headers: {'Content-Type':'application/json'},
      body: jsonEncode(
        {
        "nome":exercicio.nome,
        "series":exercicio.series,
        "repeticoes":exercicio.repeticoes,
        "observacoes":exercicio.observacoes
        }
        ));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Exercicio.fromJson(jsonDecode(response.body));
    }
    throw Exception("Erro não foi possível salvar o exercício!");
  }

  static Future<List<Exercicio>> getExercicios() async {
    final response = await http.get(Uri.parse(baseUrl));

    List<Exercicio> exercicios = [];

    if (response.statusCode == 200) {
      List<dynamic> jbody = jsonDecode(response.body);
      return jbody.map((data) => Exercicio.fromJson(data)).toList();

    }
    throw Exception("Erro não foi possível retornar a lista de exercícios!");
  }

  static Future<Exercicio> updateExercicio(Exercicio exercicio) async {
    int id = exercicio.id!;
    if(id != null){
      final response = await http.put(Uri.parse('${baseUrl}/$id'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(
          {
          "nome":exercicio.nome,
          "series":exercicio.series,
          "repeticoes":exercicio.repeticoes,
          "observacoes":exercicio.observacoes
          }
          ));
          print("ERRO: ${response.statusCode}");
          print({response.body});

      if (response.statusCode == 200) {
        return Exercicio.fromJson(jsonDecode(response.body));
      }

      throw Exception("Erro não foi possível atualizar o exercício!");
    }else{
      throw Exception("O id do exercício é inválido");
    }
  }

  static Future<Exercicio> deleteExercicio(int id) async {
    final response = await http.delete(Uri.parse('${baseUrl}/$id'));

    if (response.statusCode == 200) {
      return Exercicio.fromJson(jsonDecode(response.body));
    }

    throw Exception("Erro não foi possível deletar o exercício!");
  }
}
