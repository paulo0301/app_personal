import 'package:app_personal/models/academia.dart';
import 'package:flutter/material.dart';

class AcademiaDetalhes extends StatelessWidget {
  Academia academia;
  AcademiaDetalhes({Key? key, required this.academia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Image.network(
            'https://www.aubicon.com.br/wp-content/uploads/2021/03/06_diferenciais_academia_blog_1200x800px_100_8.jpg',
            height: 250,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 24, left: 24),
            child: Text(
              academia.nome,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 60, left: 24),
            child: Text(
              academia.endereco,
            ),
          ),
        ],
      ),
    );
  }
}
