import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormAluno extends StatefulWidget {
  Function(String, String, DateTime) onSubmit;

  FormAluno(this.onSubmit);

  @override
  State<FormAluno> createState() => _FormAlunoState();
}

class _FormAlunoState extends State<FormAluno> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  DateTime _dataNascimentoSelecionada = DateTime.now();

  _submitForm() {
    if (_nomeController.text.isEmpty || _emailController.text.isEmpty) return;

    widget.onSubmit(_nomeController.text, _emailController.text,
        _dataNascimentoSelecionada);
    Navigator.of(context).pop();

  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: _dataNascimentoSelecionada,
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _dataNascimentoSelecionada = pickedDate;
      });
    });
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
                  "Email: ",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      const InputDecoration(contentPadding: EdgeInsets.all(0)),
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                      'Data de nascimento: ${DateFormat('dd/MM/y').format(_dataNascimentoSelecionada)}',
                      style: const TextStyle(fontSize: 15)),
                ),
                TextButton(
                    onPressed: _showDatePicker, child: const Text('Selecionar'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Cadastrar aluno'),
            ),
          )
        ],
      ),
    );
  }
}
