// ignore_for_file: unused_import, prefer_const_constructors, avoid_print

import 'dart:io';
import 'dart:math';

import 'package:app_personal/components/form_aluno.dart';
import 'package:app_personal/components/main_drawer.dart';
import 'package:app_personal/controller/AlunoController.dart';
import 'package:app_personal/controller/FichaTreinoController.dart';
import 'package:app_personal/models/aluno.dart';
import 'package:app_personal/models/ficha_treino.dart';
import 'package:app_personal/screens/ficha_treino_screen.dart';
import 'package:app_personal/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Aluno>> alunos;

  @override
  void initState() {
    super.initState();
    alunos = AlunoController.getAlunos();
  }

  _deleteAluno(Aluno aluno) {
    AlunoController.deleteAluno(aluno.id);
    _updateScreen();
    Navigator.of(context).pop();
  }

  _saveFormEditAluno() {
    setState(() {});
  }

  Widget _createCardAluno(Aluno aluno, Function() onTap) {
    File? imageFile = aluno.avatarPath != null ? File(aluno.avatarPath!) : null;
    return InkWell(
        onTap: onTap,
        child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: aluno.avatarPath != null
                ? ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: FileImage(imageFile!),
                    ),
                    title: Text(aluno.nome),
                    subtitle: Text(aluno.email),
                  )
                : ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/man.png'),
                    ),
                    title: Text(aluno.nome),
                    subtitle: Text(aluno.email),
                  )));
  }

  _updateScreen() {
    setState(() {
      alunos = AlunoController.getAlunos();
    });
  }

  _addAluno(String nome, String email, DateTime dataNascimento, File? avatar) {
    int idAluno = Random().nextInt(9999);
    FichaDeTreino fichaDeTreino =
        FichaDeTreino(id: Random().nextInt(99), alunoId: idAluno, titulo: "Ficha de treino");
    Fichatreinocontroller.addFIcha(fichaDeTreino);
    Aluno newAluno = Aluno(
        id: idAluno,
        nome: nome,
        email: email,
        dataNascimento: dataNascimento,
        fichaTreino: fichaDeTreino);

    if (avatar != null) {
      newAluno.avatarPath = avatar.path;
    }

    AlunoController.addAluno(newAluno);
    _updateScreen();
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
              print("erro: ${snapshot.error}");
              return const Center(
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
