import 'dart:convert';

import 'package:app_personal/models/ficha_treino.dart';

import '../models/aluno.dart';
import 'package:http/http.dart' as http;

class AlunoController {
  AlunoController();

  static const baseUrl =
      'https://personal-app-90b28-default-rtdb.firebaseio.com/aluno.json';

  static Future<List<Aluno>> getAlunos() async {
    final response = await http.get(Uri.parse(baseUrl));

    List<Aluno> alunos = [];
    print("Lista delcarada!");

    if (response.statusCode == 200) {
      print("200 ok");
      final Map<String, dynamic> jbody = jsonDecode(response.body);

      jbody.forEach((key, value) {
        Aluno aluno = new Aluno(
            id: key,
            nome: value['nome'],
            email: value['email'],
            dataNascimento: DateTime.parse(value['dataNascimento']),
            fichaTreino: FichaDeTreino.fromJson(value['fichaTreino']));

        alunos.add(aluno);
      });

      return alunos;
    }

    throw Exception("Erro ao recuperar lista de alunos");
  }

  static Future<Aluno> addAluno(Aluno aluno) async {
    final response = await http.post(
        Uri.parse(
            'https://personal-app-90b28-default-rtdb.firebaseio.com/aluno.json'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(aluno.toJson()));

    if (response.statusCode == 200) {
      return Aluno.fromJson(jsonDecode(response.body));
    }

    throw Exception("Erro não foi possível salvar o aluno!");
  }

  static Future<Aluno> updateAluno(Aluno aluno) async {
    String dataFormat = aluno.dataNascimento.toIso8601String();
    final response = await http.put(Uri.parse(baseUrl),
        body: jsonEncode({
          'nome': aluno.nome,
          'email': aluno.email,
          'dataNascimento': dataFormat,
          'avaliacoesFisicas': aluno.avaliacoesFisicas,
          'fichaTreino': aluno.fichaTreino
        }));

    if (response.statusCode == 200) {
      return Aluno.fromJson(jsonDecode(response.body));
    }

    throw Exception("Erro não foi possível salvar o aluno!");
  }

  static Future<Aluno> deleteAluno(String id) async {
    final http.Response response = await http.delete(Uri.parse(
        'https://mini-projeto-iv---flutter-default-rtdb.firebaseio.com/aluno/$id.json'));

    if (response.statusCode == 200) {
      print("200 OK DELETE");
      return Aluno.fromJson(jsonDecode(response.body));
    }

    throw Exception("Não foi possível deletar o aluno!");
  }
}
