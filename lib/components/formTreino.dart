import 'dart:math';

import 'package:app_personal/controller/ExercicioController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/exercicio.dart';

class formTreino extends StatefulWidget {
  Function(String, String, List<Exercicio>) onSubmit;
  formTreino({required this.onSubmit});

  @override
  State<formTreino> createState() => _formTreinoState();
}

class _formTreinoState extends State<formTreino> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _grupoController = TextEditingController();
  List<Exercicio> exercicios = [];
  late Future<List<Exercicio>> lst_future;
  List<bool> _checkes = [];

  @override
  void initState() {
    super.initState();
    lst_future = ExercicioController.getExercicios();
    _checkes = [];
  }

  _adicionarExercicio(Exercicio exercicio, int index) {
    setState(() {
      if (_checkes[index]) {
        exercicios.add(exercicio);
      } else {
        exercicios.remove(exercicio);
      }
    });
  }

  _createCardExercicio(Exercicio exercicio, int index) {
    return Card(
      color: _checkes[index] ? Colors.green.shade500 : Colors.grey.shade300,
      child: ListTile(
        leading: exercicio.execucao != null
            ? Image.network(exercicio.execucao!)
            : Icon(Icons.image_not_supported),
        title: Text(exercicio.titulo),
        subtitle: Text(
            "Séries: ${exercicio.series} Repetições: ${exercicio.repeticoes}"),
        trailing: IconButton(
          icon: _checkes[index]
              ? const Icon(
                  Icons.close,
                  color: Colors.red,
                )
              : const Icon(Icons.add_rounded),
          onPressed: () {
            setState(() {
              _checkes[index] = !_checkes[index];
            });
            _adicionarExercicio(exercicio, index);
          },
        ),
      ),
    );
  }

  _submitForm() {
    widget.onSubmit(_nomeController.text, _grupoController.text, exercicios);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Formulário de treino",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF085444),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Titulo: "),
            TextField(
              controller: _nomeController,
            ),
            SizedBox(height: 20),
            const Text("Grupos musculares trabalhados: "),
            TextField(
              controller: _grupoController,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Exercícios"),
            ),
            Expanded(
              child: FutureBuilder<List<Exercicio>>(
                future: lst_future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError ||
                      snapshot.connectionState == ConnectionState.done &&
                          snapshot.data!.isEmpty) {
                    return Center(
                      child: Text("Não há exercícios cadastrados!"),
                    );
                  } else if (snapshot.hasData) {
                    // Inicialize _checkes apenas quando tiver dados
                    if (_checkes.isEmpty) {
                      _checkes =
                          List.generate(snapshot.data!.length, (index) => false);
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return _createCardExercicio(snapshot.data![index], index);
                      },
                    );
                  } else {
                    return Center(
                      child: Text("Erro ao carregar exercícios."),
                    );
                  }
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ElevatedButton(
                  onPressed: () {
                    _submitForm();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Adicionar treino"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
