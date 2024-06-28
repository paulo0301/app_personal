import 'dart:math';

import 'package:app_personal/components/card_avaliacao_fisica.dart';
import 'package:app_personal/components/formAvalicao.dart';
import 'package:app_personal/controller/AlunoController.dart';
import 'package:app_personal/models/avaliacao_fisica.dart';
import 'package:flutter/material.dart';

import '../models/aluno.dart';

class AvaliacoesFisica extends StatefulWidget {
  Aluno aluno;
  AvaliacoesFisica({required this.aluno});

  @override
  State<AvaliacoesFisica> createState() => _AvaliacoesFisicaState();
}

class _AvaliacoesFisicaState extends State<AvaliacoesFisica> {
  late Future<List<AvaliacaoFisica>> _listAvaliacoes;
  @override
  void initState() {
    super.initState();
    _listAvaliacoes = AlunoController.getAvalicaoes(widget.aluno.id);
  }

  _addAvalicao(
      String descricao,
      double altura,
      double peso,
      String? observacoes,
      double? medidaCintura,
      double? medidaBraco,
      double? medidaPerda,
      double? medidaPeito) {
    AvaliacaoFisica avaliacao = AvaliacaoFisica(
      id: 'ft${Random().nextInt(9999)}',
      descricao: descricao,
      alunoId: widget.aluno.id,
      peso: peso,
      altura: altura,
      observacoes: observacoes,
      medidaCintura: medidaCintura,
      medidaBraco: medidaBraco,
      medidaPerda: medidaPerda,
      medidaPeito: medidaPeito,
    );
    setState(() {
      widget.aluno.adicionarAvalicao(avaliacao);
      AlunoController.updateAluno(widget.aluno);
    });
  }

  _openFormAvalicao(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => formAvaliacao(
                  onSubmit: _addAvalicao,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<AvaliacaoFisica>>(
        future: _listAvaliacoes,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("ERRO: ${snapshot.error}");
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Não há avaliações cadastradas para esse usuário"),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => {_openFormAvalicao(context)},
                    child: Text("Nova avaliação +"),
                  )
                ],
              ),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data!.length,
                itemBuilder: (avaliacao, index) {
                  return cardAvalicaoFisica(
                      avaliacaoFisica: snapshot.data![index], index: index + 1);
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
