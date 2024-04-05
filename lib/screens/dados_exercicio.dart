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
        backgroundColor: Color.fromARGB(255, 4, 114, 86),
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
