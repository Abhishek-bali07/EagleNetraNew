// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManagementViewModel on _ManagementViewModel, Store {
  late final _$managementHistoryAtom =
      Atom(name: '_ManagementViewModel.managementHistory', context: context);

  @override
  List<AccessDetails> get managementHistory {
    _$managementHistoryAtom.reportRead();
    return super.managementHistory;
  }

  @override
  set managementHistory(List<AccessDetails> value) {
    _$managementHistoryAtom.reportWrite(value, super.managementHistory, () {
      super.managementHistory = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ManagementViewModel.isLoading', context: context);

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

  late final _$guardianNameAtom =
      Atom(name: '_ManagementViewModel.guardianName', context: context);

  @override
  String get guardianName {
    _$guardianNameAtom.reportRead();
    return super.guardianName;
  }

  @override
  set guardianName(String value) {
    _$guardianNameAtom.reportWrite(value, super.guardianName, () {
      super.guardianName = value;
    });
  }

  late final _$relationNameAtom =
      Atom(name: '_ManagementViewModel.relationName', context: context);

  @override
  String get relationName {
    _$relationNameAtom.reportRead();
    return super.relationName;
  }

  @override
  set relationName(String value) {
    _$relationNameAtom.reportWrite(value, super.relationName, () {
      super.relationName = value;
    });
  }

  late final _$imageAtom =
      Atom(name: '_ManagementViewModel.image', context: context);

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

  late final _$RmessageAtom =
      Atom(name: '_ManagementViewModel.Rmessage', context: context);

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

  @override
  String toString() {
    return '''
managementHistory: ${managementHistory},
isLoading: ${isLoading},
guardianName: ${guardianName},
relationName: ${relationName},
image: ${image},
Rmessage: ${Rmessage}
    ''';
  }
}
