import 'package:app_personal/data/data.dart';
import 'package:app_personal/screens/dados_exercicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/exercicio.dart';
import '../models/treino.dart';

class dadosTreino extends StatefulWidget {
  Treino treino;
  dadosTreino({required this.treino});

  @override
  State<dadosTreino> createState() => _dadosTreinoState();
}

class _dadosTreinoState extends State<dadosTreino> {
  String nomeTreino = '';
  String grupoMuscular = '';
  List<Exercicio> exercicios = [];

  _createExerciciCard(Exercicio exercicio) {
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

  _openDetailExercicio(BuildContext context, Exercicio exercicio) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return DetalhesExercicio(exercicio: exercicio);
    }));
  }

  @override
  void initState() {
    super.initState();
    nomeTreino = widget.treino.titulo;
    exercicios = widget.treino.exercicios;
    grupoMuscular = widget.treino.grupoMuscular;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          nomeTreino,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 4, 114, 86),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Grupos musculares: ${grupoMuscular}",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              Text("${exercicios.length} Exercícios",
                  style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
              Expanded(
                  child: ListView.builder(
                      itemCount: exercicios.length,
                      itemBuilder: (exercicio, index) {
                        return _createExerciciCard(exercicios[index]);
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
