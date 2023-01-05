// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobileInput_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobileInputViewModel on _MobileInputViewModel, Store {
  late final _$gettingDataLoaderAtom =
      Atom(name: '_MobileInputViewModel.gettingDataLoader', context: context);

  @override
  bool get gettingDataLoader {
    _$gettingDataLoaderAtom.reportRead();
    return super.gettingDataLoader;
  }

  @override
  set gettingDataLoader(bool value) {
    _$gettingDataLoaderAtom.reportWrite(value, super.gettingDataLoader, () {
      super.gettingDataLoader = value;
    });
  }

  late final _$sendingLoaderAtom =
      Atom(name: '_MobileInputViewModel.sendingLoader', context: context);

  @override
  bool get sendingLoader {
    _$sendingLoaderAtom.reportRead();
    return super.sendingLoader;
  }

  @override
  set sendingLoader(bool value) {
    _$sendingLoaderAtom.reportWrite(value, super.sendingLoader, () {
      super.sendingLoader = value;
    });
  }

  late final _$isShowAtom =
      Atom(name: '_MobileInputViewModel.isShow', context: context);

  @override
  bool get isShow {
    _$isShowAtom.reportRead();
    return super.isShow;
  }

  @override
  set isShow(bool value) {
    _$isShowAtom.reportWrite(value, super.isShow, () {
      super.isShow = value;
    });
  }

  late final _$mobileNumberAtom =
      Atom(name: '_MobileInputViewModel.mobileNumber', context: context);

  @override
  String get mobileNumber {
    _$mobileNumberAtom.reportRead();
    return super.mobileNumber;
  }

  @override
  set mobileNumber(String value) {
    _$mobileNumberAtom.reportWrite(value, super.mobileNumber, () {
      super.mobileNumber = value;
    });
  }

  late final _$enableBtnAtom =
      Atom(name: '_MobileInputViewModel.enableBtn', context: context);

  @override
  bool get enableBtn {
    _$enableBtnAtom.reportRead();
    return super.enableBtn;
  }

  @override
  set enableBtn(bool value) {
    _$enableBtnAtom.reportWrite(value, super.enableBtn, () {
      super.enableBtn = value;
    });
  }

  late final _$onNextAsyncAction =
      AsyncAction('_MobileInputViewModel.onNext', context: context);

  @override
  Future onNext() {
    return _$onNextAsyncAction.run(() => super.onNext());
  }

  late final _$validateInputAsyncAction =
      AsyncAction('_MobileInputViewModel.validateInput', context: context);

  @override
  Future validateInput() {
    return _$validateInputAsyncAction.run(() => super.validateInput());
  }

  late final _$_MobileInputViewModelActionController =
      ActionController(name: '_MobileInputViewModel', context: context);

  @override
  dynamic onNumberClear() {
    final _$actionInfo = _$_MobileInputViewModelActionController.startAction(
        name: '_MobileInputViewModel.onNumberClear');
    try {
      return super.onNumberClear();
    } finally {
      _$_MobileInputViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onNumberChange(String number) {
    final _$actionInfo = _$_MobileInputViewModelActionController.startAction(
        name: '_MobileInputViewModel.onNumberChange');
    try {
      return super.onNumberChange(number);
    } finally {
      _$_MobileInputViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gettingDataLoader: ${gettingDataLoader},
sendingLoader: ${sendingLoader},
isShow: ${isShow},
mobileNumber: ${mobileNumber},
enableBtn: ${enableBtn}
    ''';
  }
}
