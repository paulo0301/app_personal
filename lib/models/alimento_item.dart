class AlimentoItem{
  String nome;
  String categoria;
  int calorias;
  int peso;
  String? imagem;

  AlimentoItem({
    required this.nome,
    required this.categoria,
    required this.calorias,
    required this.peso,
    this.imagem
  });
}