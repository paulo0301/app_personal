import 'package:app_personal/components/formExercicio.dart';
import 'package:app_personal/components/main_drawer.dart';
import 'package:app_personal/controller/ExercicioController.dart';
import 'package:app_personal/data/data.dart';
import 'package:flutter/material.dart';

import '../models/exercicio.dart';
import 'dados_exercicio.dart';

class ExerciciosPage extends StatefulWidget {
  ExerciciosPage({super.key});

  @override
  State<ExerciciosPage> createState() => _ExerciciosPageState();
}

class _ExerciciosPageState extends State<ExerciciosPage> {
  Future<List<Exercicio>> exercicios = ExercicioController.getExercicios();
  Future<List<Exercicio>> exerciciosFilter =
      ExercicioController.getExercicios();

  @override
  void initState() {
    super.initState();
    exerciciosFilter = exercicios;
  }

  _updateList(Exercicio exercicio) {
    setState(() {
      ExercicioController.addExercicio(exercicio);
    });
  }

  _removeExercicio(String id) {
    setState(() {
      ExercicioController.deleteExercicio(id);
    });
  }

  _filter(String key) {
    Future<List<Exercicio>> findExercicio;
    if (key.isEmpty) {
      findExercicio = exercicios;
    } else {
      findExercicio = exercicios.then((listaExercicios) {
        // Filtra os exercícios cujo título contenha a chave (ignorando maiúsculas e minúsculas)
        return listaExercicios
            .where((exercicio) =>
                exercicio.titulo.toLowerCase().contains(key.toLowerCase()))
            .toList();
      });
    }
    setState(() {
      exerciciosFilter = findExercicio;
    });
  }

  _openDetailExercicio(BuildContext context, Exercicio exercicio) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return DetalhesExercicio(exercicio: exercicio);
    }));
  }

  _createExerciciCard(BuildContext context, Exercicio exercicio) {
    return Card(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 60,
              height: 60,
              child: exercicio.execucao != null
                  ? Image.network(exercicio.execucao!, fit: BoxFit.cover)
                  : Text("Sem videos de execução no momento...")),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exercicio.titulo,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(exercicio.series.toString()),
                      Text("Séries")
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text("${exercicio.series.toString()} X"),
                      Text("Repetições")
                    ],
                  ),
                ],
              )
            ],
          ),
          Row(children: [
            IconButton(
                onPressed: () {
                  _openDetailExercicio(context, exercicio);
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            IconButton(
              onPressed: () {
                _removeExercicio(exercicio.id);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.black,
              ),
            )
          ])
        ],
      ),
    ));
  }

  _openFormExercicio() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => formExercicio(onSubmit: _updateList)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exercícios",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF085444),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _filter(value),
              decoration: InputDecoration(
                  label: Text("Pesquisar"), suffixIcon: Icon(Icons.search)),
            ),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Exercicio>>(
                future: exerciciosFilter,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Não há exercicios cadastrados!"),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (exercicio, index) {
                          return _createExerciciCard(
                              context, snapshot.data![index]);
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openFormExercicio(),
        child: Icon(Icons.add),
      ),
      drawer: MainDrawer(),
    );
  }
}
