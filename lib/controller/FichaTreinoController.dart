import 'dart:convert';


import 'package:app_personal/models/ficha_treino.dart';
import 'package:http/http.dart' as http;


class Fichatreinocontroller{
  Fichatreinocontroller();

    static const String baseUrl = 'http://192.168.1.104:8080/personal/api/ficha_treino';

    static Future<FichaDeTreino> addFIcha(FichaDeTreino ficha) async{
      final response = await http.post(Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
       body: jsonEncode({
          "titulo":ficha.titulo,
          "aluno":ficha.alunoId
        }));

      if(response.statusCode == 200){
        return FichaDeTreino.fromJson(jsonDecode(response.body));
      }
      
      throw Exception("Não foi possível salvar a ficha");
    }
static Future<FichaDeTreino> get(int alunoId) async {
  final response = await http.get(Uri.parse(baseUrl));

  if (response.statusCode == 200) {
    List<dynamic> jbody = jsonDecode(response.body);
    List<FichaDeTreino> fichas = jbody.map((data) => FichaDeTreino.fromJson(data)).toList();
    
    try {
      FichaDeTreino ficha = fichas.firstWhere((ficha) => ficha.alunoId == alunoId);
      return ficha;
    } catch (e) {
      throw Exception("Ficha de treino não encontrada para o aluno com ID: $alunoId");
    }
  } else {
    throw Exception("Não foi possível retornar as fichas de treino");
  }
}

}