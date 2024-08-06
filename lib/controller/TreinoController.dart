import 'dart:convert';

import 'package:app_personal/models/treino.dart';
import 'package:http/http.dart' as http;

import '../models/exercicio.dart';

class TreinoController {
  TreinoController();

  static const String baseUrl = 'http://192.168.1.104:8080/personal/api/treino';

  static Future<Treino> addTreino(Treino treino) async {
  print("Adicionar treinoi");
  List<int> ids = treino.exercicios.map((exercicio) => exercicio.id!).toList();
  
  final response = await http.post(
    Uri.parse(baseUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      "titulo": treino.titulo,
      "ficha_treino": treino.ficha_treino,
      "data_vencimento": treino.data_vencimento.toIso8601String(),
      "exercicios": ids,
    }),
  );

  print("ID DO TREINO");
  print(treino.id);
  print("ID DA FICHA: ${treino.ficha_treino}");
  print("STATUS CODE: ${response.statusCode}");
  print("BODY: ${response.body}");  // Adicione este print para verificar o corpo da resposta

  if (response.statusCode == 200 || response.statusCode == 201) {
    try {
      return Treino.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception("Erro ao decodificar a resposta: $e");
    }
  } else {
    throw Exception("Não foi possível salvar o treino");
  }
}


  static Future<List<Treino>> getTreino(int id) async {
    final response = await http.get(Uri.parse('http://192.168.1.104:8080/personal/api/treino/getTreinoFicha/$id'));
    print("Entro no método");
    print("RESPOSTA: ${response.statusCode}");
print("BODY: ${response.body}");

    if (response.statusCode == 200) {
      List<dynamic> jbody = jsonDecode(response.body);
      List<Treino> treinos =
          jbody.map((treino) => Treino.fromJson(treino)).toList();
      return treinos;
    }

    throw Exception("Não foi possível retornar os treinos do alunos");
  }
}
