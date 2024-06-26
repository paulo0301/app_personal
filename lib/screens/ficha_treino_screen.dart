import 'dart:math';

import 'package:app_personal/components/formTreino.dart';
import 'package:app_personal/models/ficha_treino.dart';
import 'package:app_personal/screens/dados_treino.dart';
import 'package:flutter/material.dart';

import '../models/aluno.dart';
import '../models/exercicio.dart';
import '../models/treino.dart';

class FichaTreino extends StatefulWidget {
  FichaDeTreino fichaDeTreino;
  FichaTreino({required this.fichaDeTreino});

  @override
  State<FichaTreino> createState() => _FichaTreinoState();
}

class _FichaTreinoState extends State<FichaTreino> {
  List<Treino> treinos = [];
  @override
  void initState() {
    super.initState();
    treinos = widget.fichaDeTreino.treinos;
  }

  _adicionarTreino(
      String titulo, String grupoMuscular, List<Exercicio> exercicios) {
    Treino treino = new Treino(
        id: ('ft${Random().nextInt(9999)}'),
        titulo: titulo,
        grupoMuscular: grupoMuscular,
        exercicios: exercicios);
    setState(() {
      widget.fichaDeTreino.adicionarTreino(treino);
    });
  }

  _openFormTreino(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return formTreino(onSubmit: _adicionarTreino);
    }));
  }

  _openTreinoDetail(BuildContext context, Treino treino) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return dadosTreino(treino: treino);
    }));
  }

  _createTreinoCard(Treino treino) {
    return Card(
      child: ListTile(
        onTap: () {
          _openTreinoDetail(context, treino);
        },
        //leading: Icon(Icons.list_alt),
        title: Text(treino.titulo),
        subtitle: Text("Grupos musculares: ${treino.grupoMuscular}"),
        trailing: Icon(Icons.search),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: treinos.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Não há treinos cadastrados para o aluno"),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _openFormTreino(context);
                    },
                    child: Text("Cadastrar novo treino +"),
                  ),
                ],
              ),
            )
          : Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: treinos.length,
                  itemBuilder: (treino, index) {
                    return _createTreinoCard(treinos[index]);
                  },
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openFormTreino(context);
        },
        child: Icon(Icons.add_outlined),
      ),
    );
  }
}
