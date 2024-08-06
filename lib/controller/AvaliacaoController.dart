import 'dart:convert';

import 'package:app_personal/models/avaliacao_fisica.dart';
import 'package:http/http.dart' as http;

class Avaliacaocontroller {
  Avaliacaocontroller();

  static int idAluno = 2;

  static const baseUrl =
      'http://192.168.1.104:8080/personal/api/avaliacao_fisica';

  static Future<AvaliacaoFisica> addAvaliacao(AvaliacaoFisica avaliacao) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "titulo": avaliacao.titulo,
          "data": avaliacao.data,
          "aluno": idAluno.toString(),
          "alunoPeso": avaliacao.peso,
          "alunoAltura": avaliacao.altura,
          "medidaPeito": avaliacao.medidaPeito,
          "medidaBraco": avaliacao.medidaBraco,
          "medidaPerna": avaliacao.medidaPerda,
          "medidaCintura": avaliacao.medidaCintura
        }));

    print("RESPOSTA: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return AvaliacaoFisica.fromJson(jsonDecode(response.body));
    }
    throw Exception("Erro não foi possível salvar o exercício!");
  }

  static Future<List<AvaliacaoFisica>> getAvaliacoes() async {
    final response =
        await http.get(Uri.parse('$baseUrl/getAvaliacaoFisicaByIdAluno/${2}'));

    print('ALOUUUUUUUUUUUUUUUUUUUUU');
    if (response.statusCode == 200) {
      List<dynamic> jbody = jsonDecode(response.body);
      // print(jbody);

      return jbody.map((data) => AvaliacaoFisica.fromJson(data)).toList();
    }

    throw Exception("ERRO não foi possível recuperar as avalições físicas");
  }

  static Future<List<AvaliacaoFisica>> getAvaliacoesAluno(int id) async {
    List<AvaliacaoFisica> avaliacoes = await getAvaliacoes();
    List<AvaliacaoFisica> avaliacoes_aluno =
        avaliacoes.where((avaliacao) => avaliacao.id == id).toList();
    return avaliacoes_aluno;
  }

  static Future<AvaliacaoFisica> deleteAvaliacao(int id) async {
    final response = await http.delete(Uri.parse('${baseUrl}/$id'));

    if (response.statusCode == 200) {
      return AvaliacaoFisica.fromJson(jsonDecode(response.body));
    }

    throw Exception("Erro não foi possível deletar a avaliação!");
  }
}
