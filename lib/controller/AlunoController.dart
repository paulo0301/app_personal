import 'dart:convert';

import 'package:app_personal/models/exercicio.dart';
import 'package:app_personal/models/ficha_treino.dart';
import 'package:app_personal/models/treino.dart';

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
    print("EDITAR");
    String id = aluno.id;
    final response = await http.put(
        Uri.parse(
            'https://personal-app-90b28-default-rtdb.firebaseio.com/aluno/$id.json'),
        body: jsonEncode(<String, dynamic>{
          'nome': aluno.nome,
          'email': aluno.email,
          'dataNascimento': aluno.dataNascimento.toIso8601String(),
          'avaliacoesFisicas': aluno.avaliacoesFisicas
              .map((avaliacao) => avaliacao.toJson())
              .toList(),
          'fichaTreino': aluno.fichaTreino.toJson(aluno.id),
        }));

    if (response.statusCode == 200) {
      print("200 EDIT");
      return Aluno.fromJson(jsonDecode(response.body));
    }

    throw Exception("Erro não foi possível salvar o aluno!");
  }

  static Future<Aluno> addFIchaTreino(String id, FichaDeTreino ficha) async {
    final response = await http.put(
        Uri.parse(
            'https://personal-app-90b28-default-rtdb.firebaseio.com/aluno/$id/fichaTreino.json'),
        body: jsonEncode(ficha.toJson(id)));

    if (response.statusCode == 200) {
      return Aluno.fromJson(jsonDecode(response.body));
    }

    throw Exception("Erro não foi possível salvar o aluno!");
  }

  static Future<Aluno> deleteAluno(String id) async {
    final http.Response response = await http.delete(Uri.parse(
        'https://personal-app-90b28-default-rtdb.firebaseio.com/aluno/$id.json'));

    if (response.statusCode == 200) {
      print("200 OK DELETE");
      return Aluno.fromJson(jsonDecode(response.body));
    }

    throw Exception("Não foi possível deletar o aluno!");
  }

  static Future<List<Treino>> getTreinos(String id) async{
    final response = await http.get(
      Uri.parse('https://personal-app-90b28-default-rtdb.firebaseio.com/aluno/$id/fichaTreino/treinos')
    );

    List<Treino> treinos = [];

    if(response.statusCode == 200){
      final Map<String,dynamic> jbody = jsonDecode(response.body);

      jbody.forEach((key,value){
        List<Exercicio> exercicios = [];
        if (value['exercicios'] != null) {
          value['exercicios'].forEach((exercicio) {
            exercicios.add(Exercicio.fromJson(exercicio));
          });
        }
        Treino treino = new Treino(
          id: key, titulo: value['titulo'], 
          exercicios: exercicios, 
          grupoMuscular: value['grupoMuscular']);

        treinos.add(treino);
      });

      return treinos;
    }

    throw Exception("Erro não foi possível recuperar o treinos do aluno!");
  }
}
