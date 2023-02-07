// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_management_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccessManagementViewModel on _AccessManagementViewModel, Store {
  late final _$gettingLoaderAtom =
      Atom(name: '_AccessManagementViewModel.gettingLoader', context: context);

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
      Atom(name: '_AccessManagementViewModel.valid', context: context);

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
      Atom(name: '_AccessManagementViewModel.submitting', context: context);

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

  late final _$fileAtom =
      Atom(name: '_AccessManagementViewModel.file', context: context);

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

  late final _$snackbarMessageAtom = Atom(
      name: '_AccessManagementViewModel.snackbarMessage', context: context);

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

  late final _$showPickSourceDialogAtom = Atom(
      name: '_AccessManagementViewModel.showPickSourceDialog',
      context: context);

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

  late final _$submitAccessDetailsAsyncAction = AsyncAction(
      '_AccessManagementViewModel.submitAccessDetails',
      context: context);

  @override
  Future submitAccessDetails() {
    return _$submitAccessDetailsAsyncAction
        .run(() => super.submitAccessDetails());
  }

  late final _$_AccessManagementViewModelActionController =
      ActionController(name: '_AccessManagementViewModel', context: context);

  @override
  dynamic onNameChanged(String value) {
    final _$actionInfo = _$_AccessManagementViewModelActionController
        .startAction(name: '_AccessManagementViewModel.onNameChanged');
    try {
      return super.onNameChanged(value);
    } finally {
      _$_AccessManagementViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onNumberChanged(String value) {
    final _$actionInfo = _$_AccessManagementViewModelActionController
        .startAction(name: '_AccessManagementViewModel.onNumberChanged');
    try {
      return super.onNumberChanged(value);
    } finally {
      _$_AccessManagementViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onRelationChanged(String value) {
    final _$actionInfo = _$_AccessManagementViewModelActionController
        .startAction(name: '_AccessManagementViewModel.onRelationChanged');
    try {
      return super.onRelationChanged(value);
    } finally {
      _$_AccessManagementViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSubmit() {
    final _$actionInfo = _$_AccessManagementViewModelActionController
        .startAction(name: '_AccessManagementViewModel.onSubmit');
    try {
      return super.onSubmit();
    } finally {
      _$_AccessManagementViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic pickFile() {
    final _$actionInfo = _$_AccessManagementViewModelActionController
        .startAction(name: '_AccessManagementViewModel.pickFile');
    try {
      return super.pickFile();
    } finally {
      _$_AccessManagementViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic Validate() {
    final _$actionInfo = _$_AccessManagementViewModelActionController
        .startAction(name: '_AccessManagementViewModel.Validate');
    try {
      return super.Validate();
    } finally {
      _$_AccessManagementViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gettingLoader: ${gettingLoader},
valid: ${valid},
submitting: ${submitting},
file: ${file},
snackbarMessage: ${snackbarMessage},
showPickSourceDialog: ${showPickSourceDialog}
    ''';
  }
}
