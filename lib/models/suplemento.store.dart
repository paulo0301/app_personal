import 'package:app_personal/models/suplemento_item.dart';
import 'package:mobx/mobx.dart';

part 'suplemento.store.g.dart';

class SuplementoModelX = _SuplementoModelX with _$SuplementoModelX;

abstract class _SuplementoModelX with Store{
  @observable
  ObservableList<SuplementoItem> suplementos = ObservableList<SuplementoItem>.of([
    SuplementoItem(
      nome: 'Creatina', 
      marca: 'Soldiers nutricion', 
      peso: 300,
      imagem: 'https://cdn.awsli.com.br/600x1000/2465/2465782/produto/251631774171bebf1d3.jpg'),
      SuplementoItem(
        nome: 'Whey protein', 
        marca: 'Growth', 
        peso: 500,
        imagem: 'https://www.gsuplementos.com.br/upload/produto/imagem/top-whey-protein-concentrado-1kg-growth-supplements-19.webp')
  ]);

  @computed
  List<SuplementoItem> get getItens => this.suplementos;

  @action
  void add(SuplementoItem item) => this.suplementos.add(item);  
}