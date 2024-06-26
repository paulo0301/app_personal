import 'dart:ffi';

import 'package:app_personal/components/formExercicio.dart';
import 'package:app_personal/controller/ExercicioController.dart';
import 'package:app_personal/data/data.dart';
import 'package:flutter/material.dart';
import '../models/exercicio.dart';

class DetalhesExercicio extends StatefulWidget {
  Exercicio exercicio;

  DetalhesExercicio({Key? key, required this.exercicio}) : super(key: key);

  @override
  State<DetalhesExercicio> createState() => _DetalhesExercicioState();
}

class _DetalhesExercicioState extends State<DetalhesExercicio> {
  String nomeExercicio = '';

  void initState() {
    super.initState();
    nomeExercicio = widget.exercicio.titulo;
  }

  _updateExericicio(String titulo, String repeticoes, String series,
      String descricao, String url, String grupo) {
    setState(() {
      widget.exercicio.descricao = descricao;
      widget.exercicio.titulo = titulo;
      widget.exercicio.execucao = url;
      widget.exercicio.grupoMuscular = grupo;
      widget.exercicio.series = int.parse(series);
      widget.exercicio.repeticoes = int.parse(repeticoes);
      nomeExercicio = titulo;
      ExercicioController.updateExercicio(widget.exercicio);
    });
  }

  _openEditModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return formExercicio(
              onUpdate: _updateExericicio,
              update: true,
              titulo: widget.exercicio.titulo,
              descricao: widget.exercicio.descricao,
              series: widget.exercicio.series.toString(),
              repeticoes: widget.exercicio.repeticoes.toString(),
              url: widget.exercicio.execucao ??
                  "Não há videos de execução para esse exercicio!",
              grupo: widget.exercicio.grupoMuscular);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          nomeExercicio,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _openEditModal(context);
              },
              icon: Icon(Icons.edit))
        ],
        backgroundColor: Color(0XFF085444),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.exercicio.titulo,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Descrição:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.exercicio.descricao,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Grupo Muscular:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.exercicio.grupoMuscular,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            if (widget.exercicio.execucao != null)
              Image.network(
                widget.exercicio.execucao!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
