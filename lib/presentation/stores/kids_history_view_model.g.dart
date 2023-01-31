// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kids_history_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KidsHistoryViewModel on _KidsHistoryViewModel, Store {
  late final _$kidHistoryAtom =
      Atom(name: '_KidsHistoryViewModel.kidHistory', context: context);

  @override
  List<ShortDetails> get kidHistory {
    _$kidHistoryAtom.reportRead();
    return super.kidHistory;
  }

  @override
  set kidHistory(List<ShortDetails> value) {
    _$kidHistoryAtom.reportWrite(value, super.kidHistory, () {
      super.kidHistory = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_KidsHistoryViewModel.isLoading', context: context);

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

  late final _$kidNameAtom =
      Atom(name: '_KidsHistoryViewModel.kidName', context: context);

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
      Atom(name: '_KidsHistoryViewModel.kidClass', context: context);

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
      Atom(name: '_KidsHistoryViewModel.Rmessage', context: context);

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
      Atom(name: '_KidsHistoryViewModel.image', context: context);

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
kidHistory: ${kidHistory},
isLoading: ${isLoading},
kidName: ${kidName},
kidClass: ${kidClass},
Rmessage: ${Rmessage},
image: ${image}
    ''';
  }
}
