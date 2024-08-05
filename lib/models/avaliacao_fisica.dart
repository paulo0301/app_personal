import 'package:app_personal/models/aluno.dart';

class AvaliacaoFisica {
  int id;
  String titulo;
  DateTime data = DateTime.now();
  String alunoId;
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
    required this.titulo,
    required this.alunoId,
    required this.peso,
    required this.altura,
    this.observacoes,
    this.medidaCintura,
    this.medidaBraco,
    this.medidaPeito,
    this.medidaPerda,
    this.imc,
    calcularImc,
  });

  calcularImc() {
    imc = peso / (altura * altura);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo':titulo,
      'aluno': int.parse(alunoId),
      'peso': peso,
      'altura': altura,
      'observacoes': observacoes != null ? observacoes : '',
      'medidaCintura': medidaCintura != null ? medidaCintura : '',
      'medidaBraco': medidaBraco != null ? medidaBraco : '',
      'medidaPeito': medidaPeito != null ? medidaPeito : '',
      'medidaPerda': medidaPerda != null ? medidaPerda : '',
    };
  }
  factory AvaliacaoFisica.fromJson(Map<String, dynamic> json) {
    return AvaliacaoFisica(
      id: json['id'],
      titulo: json['titulo'],
      alunoId: json['alunoId'],
      peso: json['peso'].toDouble(),  // Certifique-se de converter para double
      altura: json['altura'].toDouble(),
      observacoes: json['observacoes'],
      medidaCintura: json['medidaCintura']?.toDouble(),
      medidaBraco: json['medidaBraco']?.toDouble(),
      medidaPeito: json['medidaPeito']?.toDouble(),
      medidaPerda: json['medidaPerda']?.toDouble(),
      imc: json['imc']?.toDouble(),  // Isso é opcional, se o IMC é retornado pelo servidor
    )..calcularImc();  // Opcional: calcular IMC após deserialização
  }
}
