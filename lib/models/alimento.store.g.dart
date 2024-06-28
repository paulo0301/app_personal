// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alimento.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AlimentoModelX on _AlimentoModelX, Store {
  Computed<List<AlimentoItem>>? _$getItensComputed;

  @override
  List<AlimentoItem> get getItens =>
      (_$getItensComputed ??= Computed<List<AlimentoItem>>(() => super.getItens,
              name: '_AlimentoModelX.getItens'))
          .value;

  late final _$alimentosAtom =
      Atom(name: '_AlimentoModelX.alimentos', context: context);

  @override
  ObservableList<AlimentoItem> get alimentos {
    _$alimentosAtom.reportRead();
    return super.alimentos;
  }

  @override
  set alimentos(ObservableList<AlimentoItem> value) {
    _$alimentosAtom.reportWrite(value, super.alimentos, () {
      super.alimentos = value;
    });
  }

  late final _$_AlimentoModelXActionController =
      ActionController(name: '_AlimentoModelX', context: context);

  @override
  void add(AlimentoItem item) {
    final _$actionInfo = _$_AlimentoModelXActionController.startAction(
        name: '_AlimentoModelX.add');
    try {
      return super.add(item);
    } finally {
      _$_AlimentoModelXActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
alimentos: ${alimentos},
getItens: ${getItens}
    ''';
  }
}
