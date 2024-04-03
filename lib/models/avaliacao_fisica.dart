import 'package:app_personal/models/aluno.dart';

class AvaliacaoFisica {
  String id;
  String descricao;
  DateTime? data;
  Aluno aluno;
  double altura;
  double peso;
  double? imc;
  String? observacoes;
  double? medidaCintura;
  double? medidaBraco;
  double? medidaPerda;
  double? medidaPeito;

  AvaliacaoFisica({
    required this.id,
    required this.descricao,
    required this.aluno,
    required this.peso,
    required this.altura,
    calcularImc,
  });

  calcularImc() {
    imc = peso / (altura * altura);
  }
}
