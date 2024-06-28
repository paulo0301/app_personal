import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormAlimento extends StatefulWidget {
  Function(String, String, int, int, String) onSubmit;

  FormAlimento(this.onSubmit);

  @override
  State<FormAlimento> createState() => _FormAlimentoState();
}

class _FormAlimentoState extends State<FormAlimento> {
  final _nomeController = TextEditingController();
  final _categoriaController = TextEditingController();
  final _pesoController = TextEditingController();
  final _caloriaController = TextEditingController();
  final _imagemController = TextEditingController();

  _submitForm() {
    if (_nomeController.text.isEmpty ||
        _caloriaController.text.isEmpty ||
        _pesoController.text.isEmpty ||
        _categoriaController.text.isEmpty) return;

    widget.onSubmit(
        _nomeController.text,
        _categoriaController.text,
        int.parse(_caloriaController.text),
        int.parse(_pesoController.text),
        _imagemController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "Nome: ",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _nomeController,
                  decoration:
                      const InputDecoration(contentPadding: EdgeInsets.all(0)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "Categoria: ",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _categoriaController,
                  decoration:
                      const InputDecoration(contentPadding: EdgeInsets.all(0)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "Peso: ",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _pesoController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(contentPadding: EdgeInsets.all(0)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "Calorias: ",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _caloriaController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(contentPadding: EdgeInsets.all(0)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "Url da imagem: ",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _imagemController,
                  decoration:
                      const InputDecoration(contentPadding: EdgeInsets.all(0)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Cadastrar Alimento'),
            ),
          )
        ],
      ),
    );
  }
}
