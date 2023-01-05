// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainViewModel on _IMainViewModel, Store {
  late final _$gettingIntroDataLoaderAtom =
      Atom(name: '_IMainViewModel.gettingIntroDataLoader', context: context);

  @override
  bool get gettingIntroDataLoader {
    _$gettingIntroDataLoaderAtom.reportRead();
    return super.gettingIntroDataLoader;
  }

  @override
  set gettingIntroDataLoader(bool value) {
    _$gettingIntroDataLoaderAtom
        .reportWrite(value, super.gettingIntroDataLoader, () {
      super.gettingIntroDataLoader = value;
    });
  }

  late final _$getIntroPageDataAsyncAction =
      AsyncAction('_IMainViewModel.getIntroPageData', context: context);

  @override
  Future getIntroPageData() {
    return _$getIntroPageDataAsyncAction.run(() => super.getIntroPageData());
  }

  @override
  String toString() {
    return '''
gettingIntroDataLoader: ${gettingIntroDataLoader}
    ''';
  }
}
