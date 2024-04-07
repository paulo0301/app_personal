import 'package:app_personal/data/data.dart';
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

  List<bool> _checkes = [];
  @override
  void initState() {
    super.initState();
    _checkes = List.generate(lst_exercicios.length, (index) => false);
  }

  _adicionarExercicio(Exercicio exercicio, int index) {
    if (_checkes[index]) {
      exercicios.add(exercicio);
    } else {
      exercicios.remove(exercicio);
    }
  }

  _createCardExercicio(Exercicio exercicio, int index) {
    return Card(
      color: _checkes[index] ? Colors.green.shade500 : Colors.grey.shade300,
      child: ListTile(
        leading: Image.network(exercicio.execucao!),
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
            }),
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
                  child: ListView.builder(
                      itemCount: lst_exercicios.length,
                      itemBuilder: (exercicio, index) {
                        return _createCardExercicio(
                            lst_exercicios[index], index);
                      })),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ElevatedButton(
                      onPressed: () {
                        _submitForm();
                        Navigator.of(context).pop();
                      },
                      child: const Text("Adicionar treino")),
                ),
              )
            ],
          ),
        ));
  }
}
