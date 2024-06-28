import 'package:app_personal/models/alimento_item.dart';
import 'package:mobx/mobx.dart';

part 'alimento.store.g.dart';

class AlimentoModelX = _AlimentoModelX with _$AlimentoModelX;

abstract class _AlimentoModelX with Store {
  @observable
  ObservableList<AlimentoItem> alimentos = ObservableList<AlimentoItem>.of([
    AlimentoItem(nome: 'Banana', categoria: 'fruta', calorias: 89, peso: 100),
    AlimentoItem(nome: 'Maçã', categoria: 'fruta', calorias: 52, peso: 182),
    AlimentoItem(
        nome: 'Arroz', categoria: 'carboidrato', calorias: 129, peso: 100),
    AlimentoItem(
        nome: 'Frango', categoria: 'proteína', calorias: 165, peso: 100),
    AlimentoItem(
        nome: 'Espinafre', categoria: 'vegetal', calorias: 23, peso: 100)
  ]);

  @computed
  List<AlimentoItem> get getItens => this.alimentos;

  @action
  void add(AlimentoItem item) => alimentos.add(item);
}
