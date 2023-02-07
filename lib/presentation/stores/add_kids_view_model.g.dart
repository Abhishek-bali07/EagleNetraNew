// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_kids_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddKidViewModel on _AddKidViewModel, Store {
  late final _$gettingLoaderAtom =
      Atom(name: '_AddKidViewModel.gettingLoader', context: context);

  @override
  bool get gettingLoader {
    _$gettingLoaderAtom.reportRead();
    return super.gettingLoader;
  }

  @override
  set gettingLoader(bool value) {
    _$gettingLoaderAtom.reportWrite(value, super.gettingLoader, () {
      super.gettingLoader = value;
    });
  }

  late final _$validAtom =
      Atom(name: '_AddKidViewModel.valid', context: context);

  @override
  bool get valid {
    _$validAtom.reportRead();
    return super.valid;
  }

  @override
  set valid(bool value) {
    _$validAtom.reportWrite(value, super.valid, () {
      super.valid = value;
    });
  }

  late final _$submittingAtom =
      Atom(name: '_AddKidViewModel.submitting', context: context);

  @override
  bool get submitting {
    _$submittingAtom.reportRead();
    return super.submitting;
  }

  @override
  set submitting(bool value) {
    _$submittingAtom.reportWrite(value, super.submitting, () {
      super.submitting = value;
    });
  }

  late final _$userMobileNumberAtom =
      Atom(name: '_AddKidViewModel.userMobileNumber', context: context);

  @override
  String get userMobileNumber {
    _$userMobileNumberAtom.reportRead();
    return super.userMobileNumber;
  }

  @override
  set userMobileNumber(String value) {
    _$userMobileNumberAtom.reportWrite(value, super.userMobileNumber, () {
      super.userMobileNumber = value;
    });
  }

  late final _$fileAtom = Atom(name: '_AddKidViewModel.file', context: context);

  @override
  File? get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File? value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  late final _$snackbarMessageAtom =
      Atom(name: '_AddKidViewModel.snackbarMessage', context: context);

  @override
  Wrapper<String> get snackbarMessage {
    _$snackbarMessageAtom.reportRead();
    return super.snackbarMessage;
  }

  @override
  set snackbarMessage(Wrapper<String> value) {
    _$snackbarMessageAtom.reportWrite(value, super.snackbarMessage, () {
      super.snackbarMessage = value;
    });
  }

  late final _$showPickSourceDialogAtom =
      Atom(name: '_AddKidViewModel.showPickSourceDialog', context: context);

  @override
  DialogTrigger get showPickSourceDialog {
    _$showPickSourceDialogAtom.reportRead();
    return super.showPickSourceDialog;
  }

  @override
  set showPickSourceDialog(DialogTrigger value) {
    _$showPickSourceDialogAtom.reportWrite(value, super.showPickSourceDialog,
        () {
      super.showPickSourceDialog = value;
    });
  }

  late final _$initialDataAsyncAction =
      AsyncAction('_AddKidViewModel.initialData', context: context);

  @override
  Future initialData() {
    return _$initialDataAsyncAction.run(() => super.initialData());
  }

  late final _$_AddKidViewModelActionController =
      ActionController(name: '_AddKidViewModel', context: context);

  @override
  dynamic onNameChanged(String value) {
    final _$actionInfo = _$_AddKidViewModelActionController.startAction(
        name: '_AddKidViewModel.onNameChanged');
    try {
      return super.onNameChanged(value);
    } finally {
      _$_AddKidViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onCardNumberChanged(String value) {
    final _$actionInfo = _$_AddKidViewModelActionController.startAction(
        name: '_AddKidViewModel.onCardNumberChanged');
    try {
      return super.onCardNumberChanged(value);
    } finally {
      _$_AddKidViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDeviceChanged(String value) {
    final _$actionInfo = _$_AddKidViewModelActionController.startAction(
        name: '_AddKidViewModel.onDeviceChanged');
    try {
      return super.onDeviceChanged(value);
    } finally {
      _$_AddKidViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onClassValueChanged(String value) {
    final _$actionInfo = _$_AddKidViewModelActionController.startAction(
        name: '_AddKidViewModel.onClassValueChanged');
    try {
      return super.onClassValueChanged(value);
    } finally {
      _$_AddKidViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onAgeChanged(String value) {
    final _$actionInfo = _$_AddKidViewModelActionController.startAction(
        name: '_AddKidViewModel.onAgeChanged');
    try {
      return super.onAgeChanged(value);
    } finally {
      _$_AddKidViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onMobileChanged(String value) {
    final _$actionInfo = _$_AddKidViewModelActionController.startAction(
        name: '_AddKidViewModel.onMobileChanged');
    try {
      return super.onMobileChanged(value);
    } finally {
      _$_AddKidViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangedNumber(String value) {
    final _$actionInfo = _$_AddKidViewModelActionController.startAction(
        name: '_AddKidViewModel.onChangedNumber');
    try {
      return super.onChangedNumber(value);
    } finally {
      _$_AddKidViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic mobileNumber(String number) {
    final _$actionInfo = _$_AddKidViewModelActionController.startAction(
        name: '_AddKidViewModel.mobileNumber');
    try {
      return super.mobileNumber(number);
    } finally {
      _$_AddKidViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSubmit() {
    final _$actionInfo = _$_AddKidViewModelActionController.startAction(
        name: '_AddKidViewModel.onSubmit');
    try {
      return super.onSubmit();
    } finally {
      _$_AddKidViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic pickFile() {
    final _$actionInfo = _$_AddKidViewModelActionController.startAction(
        name: '_AddKidViewModel.pickFile');
    try {
      return super.pickFile();
    } finally {
      _$_AddKidViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validate() {
    final _$actionInfo = _$_AddKidViewModelActionController.startAction(
        name: '_AddKidViewModel.validate');
    try {
      return super.validate();
    } finally {
      _$_AddKidViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gettingLoader: ${gettingLoader},
valid: ${valid},
submitting: ${submitting},
userMobileNumber: ${userMobileNumber},
file: ${file},
snackbarMessage: ${snackbarMessage},
showPickSourceDialog: ${showPickSourceDialog}
    ''';
  }
}
