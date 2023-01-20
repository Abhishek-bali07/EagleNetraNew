// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safearea_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SafeAreaPageViewModel on _SafeAreaPageViewModel, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SafeAreaPageViewModel.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$dataLoaderAtom =
      Atom(name: '_SafeAreaPageViewModel.dataLoader', context: context);

  @override
  bool get dataLoader {
    _$dataLoaderAtom.reportRead();
    return super.dataLoader;
  }

  @override
  set dataLoader(bool value) {
    _$dataLoaderAtom.reportWrite(value, super.dataLoader, () {
      super.dataLoader = value;
    });
  }

  late final _$safeAreaListAtom =
      Atom(name: '_SafeAreaPageViewModel.safeAreaList', context: context);

  @override
  List<AreaDetails> get safeAreaList {
    _$safeAreaListAtom.reportRead();
    return super.safeAreaList;
  }

  @override
  set safeAreaList(List<AreaDetails> value) {
    _$safeAreaListAtom.reportWrite(value, super.safeAreaList, () {
      super.safeAreaList = value;
    });
  }

  late final _$kidNameAtom =
      Atom(name: '_SafeAreaPageViewModel.kidName', context: context);

  @override
  String get kidName {
    _$kidNameAtom.reportRead();
    return super.kidName;
  }

  @override
  set kidName(String value) {
    _$kidNameAtom.reportWrite(value, super.kidName, () {
      super.kidName = value;
    });
  }

  late final _$kidClassAtom =
      Atom(name: '_SafeAreaPageViewModel.kidClass', context: context);

  @override
  String get kidClass {
    _$kidClassAtom.reportRead();
    return super.kidClass;
  }

  @override
  set kidClass(String value) {
    _$kidClassAtom.reportWrite(value, super.kidClass, () {
      super.kidClass = value;
    });
  }

  late final _$RmessageAtom =
      Atom(name: '_SafeAreaPageViewModel.Rmessage', context: context);

  @override
  String get Rmessage {
    _$RmessageAtom.reportRead();
    return super.Rmessage;
  }

  @override
  set Rmessage(String value) {
    _$RmessageAtom.reportWrite(value, super.Rmessage, () {
      super.Rmessage = value;
    });
  }

  late final _$imageAtom =
      Atom(name: '_SafeAreaPageViewModel.image', context: context);

  @override
  String get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
dataLoader: ${dataLoader},
safeAreaList: ${safeAreaList},
kidName: ${kidName},
kidClass: ${kidClass},
Rmessage: ${Rmessage},
image: ${image}
    ''';
  }
}
