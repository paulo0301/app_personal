import 'dart:math';

import 'package:app_personal/components/card_avaliacao_fisica.dart';
import 'package:app_personal/components/formAvalicao.dart';
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
  List<AvaliacaoFisica> _listAvaliacoes = [];
  @override
  void initState() {
    super.initState();
    _listAvaliacoes = widget.aluno.avaliacoesFisicas;
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
      aluno: widget.aluno,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _listAvaliacoes.isEmpty
                ? Container(
                    child: Column(
                      children: [
                        Text("Não há avaliações cadastradas para esse usuário"),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => {_openFormAvalicao(context)},
                          child: Text("Nova avaliação +"),
                        )
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: widget.aluno.avaliacoesFisicas.length,
                        itemBuilder: (avaliacao, index) {
                          return cardAvalicaoFisica(
                              avaliacaoFisica:
                                  widget.aluno.avaliacoesFisicas[index],
                              index: index + 1);
                        }))
          ],
        ),
      ),
    );
  }
}
