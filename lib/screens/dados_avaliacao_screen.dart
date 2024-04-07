import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_personal/models/avaliacao_fisica.dart';

class DadosAvaliacao extends StatelessWidget {
  final AvaliacaoFisica avaliacaoFisica;

  const DadosAvaliacao({Key? key, required this.avaliacaoFisica})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalhes da Avaliação',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF085444),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Descrição:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(avaliacaoFisica.descricao),
              SizedBox(height: 10),
              Text(
                'Data de realização:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat('dd/MM/yyyy').format(avaliacaoFisica.data),
              ),
              SizedBox(height: 10),
              Text(
                'Peso (KG):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(avaliacaoFisica.peso.toString()),
              SizedBox(height: 10),
              Text(
                'Altura (CM):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(avaliacaoFisica.altura.toString()),
              SizedBox(height: 10),
              if (avaliacaoFisica.imc != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'IMC:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(avaliacaoFisica.imc!.toStringAsFixed(2)),
                  ],
                ),
              if (avaliacaoFisica.observacoes != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Observações:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(avaliacaoFisica.observacoes!),
                  ],
                ),
              SizedBox(height: 10),
              Center(
                child: Text("Medidas"),
              ),
              SizedBox(height: 30),
              Text(
                'Cintura (CM):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(avaliacaoFisica.medidaCintura.toString()),
              SizedBox(height: 10),
              Text(
                'Peito (CM):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(avaliacaoFisica.medidaPeito.toString()),
              SizedBox(height: 10),
              Text(
                'Braço (CM):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(avaliacaoFisica.medidaBraco.toString()),
              SizedBox(height: 10),
              Text(
                'Perda (CM):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(avaliacaoFisica.medidaPerda.toString()),
              SizedBox(height: 10),

              // Adicione aqui a exibição de outras informações, como medidas corporais
            ],
          ),
        ),
      ),
    );
  }
}
