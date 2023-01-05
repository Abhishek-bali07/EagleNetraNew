// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SliderStore on _SliderScreenStore, Store {
  late final _$currentPageAtom =
      Atom(name: '_SliderScreenStore.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$_SliderScreenStoreActionController =
      ActionController(name: '_SliderScreenStore', context: context);

  @override
  dynamic onChange(int page) {
    final _$actionInfo = _$_SliderScreenStoreActionController.startAction(
        name: '_SliderScreenStore.onChange');
    try {
      return super.onChange(page);
    } finally {
      _$_SliderScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onNext() {
    final _$actionInfo = _$_SliderScreenStoreActionController.startAction(
        name: '_SliderScreenStore.onNext');
    try {
      return super.onNext();
    } finally {
      _$_SliderScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
