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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
      'aluno': aluno.id,
      'peso': peso,
      'altura': altura,
      'observacoes': observacoes != null ? observacoes : '',
      'medidaCintura': medidaCintura != null ? medidaCintura : '',
      'medidaBraco': medidaBraco != null ? medidaBraco : '',
      'medidaPeito': medidaPeito != null ? medidaPeito : '',
      'medidaPerda': medidaPerda != null ? medidaPerda : '',
    };
  }
}
