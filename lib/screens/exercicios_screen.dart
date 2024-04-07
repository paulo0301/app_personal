import 'package:app_personal/components/formExercicio.dart';
import 'package:app_personal/components/main_drawer.dart';
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
  List<Exercicio> exerciciosFilter = [];

  @override
  void initState() {
    super.initState();
    exerciciosFilter = lst_exercicios;
  }

  _updateList(Exercicio exercicio) {
    setState(() {
      lst_exercicios.add(exercicio);
    });
  }

  _filter(String key) {
    List<Exercicio> findExercicio = [];
    if (key.isEmpty) {
      findExercicio = lst_exercicios;
    } else {
      findExercicio = lst_exercicios
          .where((exercicio) =>
              exercicio.titulo.toLowerCase().contains(key.toLowerCase()))
          .toList();
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
              child: Image.network(exercicio.execucao!, fit: BoxFit.cover)),
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
          IconButton(
              onPressed: () {
                _openDetailExercicio(context, exercicio);
              },
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ))
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
              child: ListView.builder(
                  itemCount: exerciciosFilter.length,
                  itemBuilder: (exercicio, index) {
                    return _createExerciciCard(
                        context, exerciciosFilter[index]);
                  }),
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
