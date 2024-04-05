import 'dart:math';

import 'package:app_personal/components/form_aluno.dart';
import 'package:app_personal/components/main_drawer.dart';
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
  List<Aluno> alunos = [
    Aluno(
      id: 'a1',
      nome: "Paulo Daniel",
      email: "pdaniel@gmail.com",
      dataNascimento: DateTime(2003, 01, 03),
      fichaTreino: FichaDeTreino(id: ('ft${Random().nextInt(9999)}')),
    ),
    Aluno(
      id: 'a2',
      nome: "Lucas Albert",
      email: "lulubert@gmail.com",
      dataNascimento: DateTime(2006, 05, 10),
      fichaTreino: FichaDeTreino(id: ('ft${Random().nextInt(9999)}')),
    ),
  ];

  _deleteAluno(Aluno? aluno) {
    setState(() {
      if (aluno != null) alunos.remove(aluno);
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
            image: AssetImage("assets/imagem-do-usuario-com-fundo-preto.png"),
          ),
          title: Text(aluno.nome),
          subtitle: Text(aluno.email),
        ),
      ),
    );
  }

  _addAluno(String nome, String email, DateTime dataNascimento) {
    FichaDeTreino fichaDeTreino =
        FichaDeTreino(id: ('ft${Random().nextInt(9999)}'));
    Aluno newAluno = Aluno(
        id: ('a${Random().nextInt(9999)}'),
        nome: nome,
        email: email,
        dataNascimento: dataNascimento,
        fichaTreino: fichaDeTreino);

    setState(() {
      alunos.add(newAluno);
    });

    Navigator.of(context).pop();
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
        backgroundColor: Color.fromARGB(255, 4, 114, 86),
      ),
      body: ListView.builder(
        itemCount: alunos.length,
        itemBuilder: (ctx, index) {
          return _createCardAluno(
            alunos[index],
            () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TabsScreen(
                        aluno: alunos[index],
                        onDelete: _deleteAluno,
                        onSave: _saveFormEditAluno,
                      )));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTaskAlunoFormModal(context),
        child: const Icon(Icons.person_add),
      ),
      drawer: MainDrawer(),
    );
  }
}
