import 'package:app_personal/models/aluno.dart';

class AvaliacaoFisica {
  String id;
  String descricao;
  DateTime data = DateTime.now();
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
    this.observacoes,
    this.medidaCintura,
    this.medidaBraco,
    this.medidaPeito,
    this.medidaPerda,
    calcularImc,
  });

  calcularImc() {
    imc = peso / (altura * altura);
  }
}
