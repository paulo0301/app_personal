// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suplemento.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SuplementoModelX on _SuplementoModelX, Store {
  Computed<List<SuplementoItem>>? _$getItensComputed;

  @override
  List<SuplementoItem> get getItens => (_$getItensComputed ??=
          Computed<List<SuplementoItem>>(() => super.getItens,
              name: '_SuplementoModelX.getItens'))
      .value;

  late final _$suplementosAtom =
      Atom(name: '_SuplementoModelX.suplementos', context: context);

  @override
  ObservableList<SuplementoItem> get suplementos {
    _$suplementosAtom.reportRead();
    return super.suplementos;
  }

  @override
  set suplementos(ObservableList<SuplementoItem> value) {
    _$suplementosAtom.reportWrite(value, super.suplementos, () {
      super.suplementos = value;
    });
  }

  late final _$_SuplementoModelXActionController =
      ActionController(name: '_SuplementoModelX', context: context);

  @override
  void add(SuplementoItem item) {
    final _$actionInfo = _$_SuplementoModelXActionController.startAction(
        name: '_SuplementoModelX.add');
    try {
      return super.add(item);
    } finally {
      _$_SuplementoModelXActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
suplementos: ${suplementos},
getItens: ${getItens}
    ''';
  }
}
