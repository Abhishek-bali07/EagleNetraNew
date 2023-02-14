// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationViewModel on _RegistrationViewModel, Store {
  late final _$validAtom =
      Atom(name: '_RegistrationViewModel.valid', context: context);

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
      Atom(name: '_RegistrationViewModel.submitting', context: context);

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
      Atom(name: '_RegistrationViewModel.file', context: context);

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

  late final _$selectedGenderAtom =
      Atom(name: '_RegistrationViewModel.selectedGender', context: context);

  @override
  String get selectedGender {
    _$selectedGenderAtom.reportRead();
    return super.selectedGender;
  }

  @override
  set selectedGender(String value) {
    _$selectedGenderAtom.reportWrite(value, super.selectedGender, () {
      super.selectedGender = value;
    });
  }

  late final _$selectedAtom =
      Atom(name: '_RegistrationViewModel.selected', context: context);

  @override
  TrackRadio get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(TrackRadio value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$snackbarMessageAtom =
      Atom(name: '_RegistrationViewModel.snackbarMessage', context: context);

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
      name: '_RegistrationViewModel.showPickSourceDialog', context: context);

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

  late final _$submitUserDetailsAsyncAction =
      AsyncAction('_RegistrationViewModel.submitUserDetails', context: context);

  @override
  Future submitUserDetails() {
    return _$submitUserDetailsAsyncAction.run(() => super.submitUserDetails());
  }

  late final _$_RegistrationViewModelActionController =
      ActionController(name: '_RegistrationViewModel', context: context);

  @override
  dynamic onNameChanged(String value) {
    final _$actionInfo = _$_RegistrationViewModelActionController.startAction(
        name: '_RegistrationViewModel.onNameChanged');
    try {
      return super.onNameChanged(value);
    } finally {
      _$_RegistrationViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onEmailChanged(String value) {
    final _$actionInfo = _$_RegistrationViewModelActionController.startAction(
        name: '_RegistrationViewModel.onEmailChanged');
    try {
      return super.onEmailChanged(value);
    } finally {
      _$_RegistrationViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSubmit() {
    final _$actionInfo = _$_RegistrationViewModelActionController.startAction(
        name: '_RegistrationViewModel.onSubmit');
    try {
      return super.onSubmit();
    } finally {
      _$_RegistrationViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onRadioSelected(TrackRadio? selectedValue) {
    final _$actionInfo = _$_RegistrationViewModelActionController.startAction(
        name: '_RegistrationViewModel.onRadioSelected');
    try {
      return super.onRadioSelected(selectedValue);
    } finally {
      _$_RegistrationViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic pickFile() {
    final _$actionInfo = _$_RegistrationViewModelActionController.startAction(
        name: '_RegistrationViewModel.pickFile');
    try {
      return super.pickFile();
    } finally {
      _$_RegistrationViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valid: ${valid},
submitting: ${submitting},
file: ${file},
selectedGender: ${selectedGender},
selected: ${selected},
snackbarMessage: ${snackbarMessage},
showPickSourceDialog: ${showPickSourceDialog}
    ''';
  }
}
