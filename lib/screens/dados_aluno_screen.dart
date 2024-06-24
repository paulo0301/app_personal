import 'package:app_personal/controller/AlunoController.dart';
import 'package:app_personal/models/aluno.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DadosAluno extends StatefulWidget {
  Aluno aluno;
  Function(Aluno) onDelete;
  Function() onSave;

  DadosAluno(
      {required this.aluno, required this.onDelete, required this.onSave});

  @override
  State<DadosAluno> createState() => _DadosAlunoState();
}

class _DadosAlunoState extends State<DadosAluno> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  DateTime _dataNascimentoSelecionada = DateTime.now();

  _deleteAluno() {
    widget.onDelete(widget.aluno);
  }

  @override
  initState() {
    super.initState();
    _nomeController.text = widget.aluno.nome;
    _emailController.text = widget.aluno.email;
    _dataNascimentoSelecionada = widget.aluno.dataNascimento;
  }

  _saveForm() {
    if (_nomeController.text.isEmpty || _emailController.text.isEmpty) return;
    widget.aluno.nome = _nomeController.text;
    widget.aluno.email = _emailController.text;
    widget.aluno.dataNascimento = _dataNascimentoSelecionada;
    AlunoController.updateAluno(widget.aluno);
    widget.onSave();

    const snackBar = SnackBar(
      content: Text("Alterações salvas com sucesso!"),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

  _confirmarExclusao() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirmar exclusão"),
        content: const Text("Deseja realmente excluir este aluno?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Não"),
          ),
          TextButton(
            onPressed: () {
              _deleteAluno();
              Navigator.pop(context);
            },
            child: const Text("Sim"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _nomeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Nome"),
                        contentPadding: EdgeInsets.all(8),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Email"),
                        contentPadding: EdgeInsets.all(8),
                      ),
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
                        onPressed: _showDatePicker,
                        child: const Text('Selecionar'))
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: _confirmarExclusao,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: const Text(
                        "Apagar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _saveForm,
                      child: const Text('Salvar'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
