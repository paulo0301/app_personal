import 'dart:math';

import 'package:app_personal/components/formTreino.dart';
import 'package:app_personal/controller/AlunoController.dart';
import 'package:app_personal/models/ficha_treino.dart';
import 'package:app_personal/screens/dados_treino.dart';
import 'package:flutter/material.dart';

import '../models/aluno.dart';
import '../models/exercicio.dart';
import '../models/treino.dart';

class FichaTreino extends StatefulWidget {
  FichaDeTreino fichaDeTreino;
  Aluno aluno;
  FichaTreino({required this.fichaDeTreino, required this.aluno});

  @override
  State<FichaTreino> createState() => _FichaTreinoState();
}

class _FichaTreinoState extends State<FichaTreino> {
  late Future<List<Treino>> treinos;
  @override
  void initState() {
    super.initState();
    treinos = AlunoController.getTreinos(widget.aluno.id);
  }

  _adicionarTreino(
      String titulo, String grupoMuscular, List<Exercicio> exercicios) {
    Treino treino = new Treino(
        id: ('ft${Random().nextInt(9999)}'),
        titulo: titulo,
        grupoMuscular: grupoMuscular,
        exercicios: exercicios);
    FichaDeTreino ficha = widget.aluno.fichaTreino;
    ficha.adicionarTreino(treino);
    widget.aluno.fichaTreino = ficha;
    setState(() {
      if (widget.aluno != null) {
        AlunoController.updateAluno(widget.aluno);
      }
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
      body: FutureBuilder<List<Treino>>(
        future: treinos,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
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
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (treino, index) {
                return _createTreinoCard(snapshot.data![index]);
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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
