import 'dart:ffi';
import 'dart:math';

import 'package:app_personal/data/data.dart';
import 'package:flutter/material.dart';

import '../models/exercicio.dart';

class formExercicio extends StatefulWidget {
  Function(Exercicio)? onSubmit;
  Function(String, String, String, String, String, String)? onUpdate;
  String titulo;
  String series;
  String repeticoes;
  String descricao;
  String url;
  String grupo;
  bool update;
  formExercicio(
      {Key? key,
      this.onSubmit,
      this.onUpdate,
      this.titulo = '',
      this.series = '',
      this.repeticoes = '',
      this.descricao = '',
      this.url = '',
      this.grupo = '',
      this.update = false})
      : super(key: key);

  @override
  State<formExercicio> createState() => _formExercicioState();
}

class _formExercicioState extends State<formExercicio> {
  TextEditingController _tituloController = TextEditingController();

  TextEditingController _seriesController = TextEditingController();

  TextEditingController _repeticoesController = TextEditingController();

  TextEditingController _descricaoController = TextEditingController();

  TextEditingController _urlImageController = TextEditingController();

  TextEditingController _grupoMuscularController = TextEditingController();

  void _addExercicio(BuildContext context) {
    if (widget.update) {
      widget.onUpdate!(
        _tituloController.text,
        _repeticoesController.text,
        _seriesController.text,
        _descricaoController.text,
        _urlImageController.text,
        _grupoMuscularController.text,
      );
      Navigator.pop(context);
    } else {
// Verificar se todos os campos obrigatórios estão preenchidos
      if (_tituloController.text.isEmpty ||
          _seriesController.text.isEmpty ||
          _repeticoesController.text.isEmpty ||
          _grupoMuscularController.text.isEmpty) {
        // Mostrar um diálogo ou mensagem de erro informando que os campos obrigatórios devem ser preenchidos
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erro'),
              content:
                  Text('Por favor, preencha todos os campos obrigatórios.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }

      Exercicio exercicio = Exercicio(
        id: 'ft${Random().nextInt(9999)}',
        titulo: _tituloController.text,
        series: int.parse(_seriesController.text),
        repeticoes: int.parse(_repeticoesController.text),
        grupoMuscular: _grupoMuscularController.text,
        descricao: _descricaoController.text,
        execucao: _urlImageController.text,
      );
      widget.onSubmit!(exercicio);
      Navigator.pop(context);
    }
  }

  void initState() {
    super.initState();
    _tituloController.text = widget.titulo;
    _seriesController.text = widget.series;
    _repeticoesController.text = widget.repeticoes;
    _descricaoController.text = widget.descricao;
    _grupoMuscularController.text = widget.grupo;
    _urlImageController.text = widget.url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.update ? "Atualizar exercício" : "Cadastrar exercício",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF085444),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Título"),
                  TextField(
                    controller: _tituloController,
                  ),
                  SizedBox(height: 15),
                  Text("Séries"),
                  TextField(
                    controller: _seriesController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 15),
                  Text("Repetições"),
                  TextField(
                    controller: _repeticoesController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 15),
                  Text("Grupo muscular"),
                  TextField(
                    controller: _grupoMuscularController,
                  ),
                  SizedBox(height: 15),
                  Text("Descrição"),
                  TextField(
                    controller: _descricaoController,
                  ),
                  SizedBox(height: 15),
                  Text("Url da imagem de execução"),
                  TextField(
                    controller: _urlImageController,
                  ),
                  SizedBox(height: 20),
                ],
              ),
              ElevatedButton(
                  onPressed: () => _addExercicio(context),
                  child: Text(widget.update
                      ? "Atualizar Exercício"
                      : "Cadastrar Exercício"))
            ],
          ),
        ),
      ),
    );
  }
}
