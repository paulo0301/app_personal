import 'package:app_personal/models/aluno.dart';

class AvaliacaoFisica {
  int id;
  String titulo;
  DateTime data;
  // String alunoId;
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
    // required this.alunoId,
    required this.peso,
    required this.altura,
    required this.data,
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
      'titulo': titulo,
      // 'aluno': int.parse(alunoId),
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
    print(json);
    return AvaliacaoFisica(
      id: json['id'],
      titulo: json['titulo'],
      data: DateTime.parse(json['data'].toString()),
      peso: json['alunoPeso'].toDouble(),
      altura: json['alunoAltura'].toDouble(),
      medidaCintura: json['medidaCintura']?.toDouble(),
      medidaBraco: json['medidaBraco']?.toDouble(),
      medidaPeito: json['medidaPeito']?.toDouble(),
      medidaPerda: json['medidaPerna']?.toDouble(),
    )..calcularImc(); // Opcional: calcular IMC após deserialização
  }
}
