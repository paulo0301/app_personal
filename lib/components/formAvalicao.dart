import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../models/aluno.dart';

class formAvaliacao extends StatefulWidget {
  Function(
      String descricao,
      double altura,
      double peso,
      String? observacoes,
      double? medidaCintura,
      double? medidaBraco,
      double? medidaPerda,
      double? medidaPeito) onSubmit;
  formAvaliacao({required this.onSubmit});

  @override
  State<formAvaliacao> createState() => _formAvaliacaoState();
}

class _formAvaliacaoState extends State<formAvaliacao> {
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _observacoesController = TextEditingController();
  TextEditingController _medidaCinturaController = TextEditingController();
  TextEditingController _medidaBracoController = TextEditingController();
  TextEditingController _medidaPerdaController = TextEditingController();
  TextEditingController _medidaPeitoController = TextEditingController();

  _onSubmitForm() {
    if (_descricaoController.text == '' ||
        _observacoesController.text == '' ||
        _pesoController.text == '' ||
        _alturaController.text == '') {
      return;
    }
    String descricao = _descricaoController.text;
    double altura = double.parse(_alturaController.text);
    double peso = double.parse(_pesoController.text);
    String observacoes = _observacoesController.text;
    double? medidaCintura = double.parse(_medidaCinturaController.text);
    double? medidaBraco = double.parse(_medidaBracoController.text);
    double? medidaPeito = double.parse(_medidaPeitoController.text);
    double? medidaPerda = double.parse(_medidaPerdaController.text);

    widget.onSubmit(descricao, altura, peso, observacoes, medidaCintura,
        medidaBraco, medidaPerda, medidaPeito);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastro de Avaliação",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF085444),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("Descrição"),
                  ),
                  TextField(
                    controller: _descricaoController,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("Peso (KG)"),
                  ),
                  TextField(
                    controller: _pesoController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("Altura (M)"),
                  ),
                  TextField(
                    controller: _alturaController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("Observações"),
                  ),
                  TextField(
                    controller: _observacoesController,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("MEDIDAS"),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("Cintura (CM)")),
                  TextField(
                    controller: _medidaCinturaController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Braço (CM)")),
                  TextField(
                    controller: _medidaBracoController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Peito (CM)")),
                  TextField(
                    controller: _medidaPeitoController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Quadríceps (CM)")),
                  TextField(
                    controller: _medidaPerdaController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () => {_onSubmitForm()},
                      child: Text("Adicionar Avaliação física"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
