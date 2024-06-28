import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormSuplemento extends StatefulWidget {
  Function(String, String, int, String) onSubmit;

  FormSuplemento(this.onSubmit);

  @override
  State<FormSuplemento> createState() => _FormSuplementoState();
}

class _FormSuplementoState extends State<FormSuplemento> {
  final _nomeController = TextEditingController();
  final _marcaController = TextEditingController();
  final _pesoController = TextEditingController();
  final _imagemController = TextEditingController();

  _submitForm() {
    if (_nomeController.text.isEmpty ||
        _marcaController.text.isEmpty ||
        _pesoController.text.isEmpty) return;

    widget.onSubmit(_nomeController.text, _marcaController.text,
        int.parse(_pesoController.text), _imagemController.text);
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
                  "Marca: ",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _marcaController,
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
              child: const Text('Cadastrar suplemento'),
            ),
          )
        ],
      ),
    );
  }
}
