import 'dart:math';

import 'package:app_personal/components/form_aluno.dart';
import 'package:app_personal/components/main_drawer.dart';
import 'package:app_personal/controller/AlunoController.dart';
import 'package:app_personal/models/aluno.dart';
import 'package:app_personal/models/ficha_treino.dart';
import 'package:app_personal/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Aluno>> alunos = AlunoController.getAlunos();

  _deleteAluno(Aluno? aluno) {
    print(aluno!.id);
    setState(() {
      if (aluno != null) AlunoController.deleteAluno(aluno.id);
    });
    Navigator.of(context).pop();
  }

  _saveFormEditAluno() {
    setState(() {});
  }

  Widget _createCardAluno(Aluno aluno, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: ListTile(
          leading: const Image(
            image: AssetImage("assets/man.png"),
          ),
          title: Text(aluno.nome),
          subtitle: Text(aluno.email),
        ),
      ),
    );
  }

  _addAluno(String nome, String email, DateTime dataNascimento) {
    setState(() {
      FichaDeTreino fichaDeTreino =
          FichaDeTreino(id: ('ft${Random().nextInt(9999)}'));
      Aluno newAluno = Aluno(
          id: ('a${Random().nextInt(9999)}'),
          nome: nome,
          email: email,
          dataNascimento: dataNascimento,
          fichaTreino: fichaDeTreino);

      AlunoController.addAluno(newAluno);
      alunos = AlunoController.getAlunos();

      Navigator.of(context).pop();
    });
  }

  _openTaskAlunoFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return FormAluno(_addAluno);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alunos",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF085444),
      ),
      body: FutureBuilder<List<Aluno>>(
          future: alunos,
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Text("Não há alunos cadastrados!"),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, index) {
                  return _createCardAluno(
                    snapshot.data![index],
                    () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TabsScreen(
                                aluno: snapshot.data![index],
                                onDelete: _deleteAluno,
                                onSave: _saveFormEditAluno,
                              )));
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() {
            _openTaskAlunoFormModal(context);
          })
        },
        child: const Icon(Icons.person_add),
      ),
      drawer: MainDrawer(),
    );
  }
}
