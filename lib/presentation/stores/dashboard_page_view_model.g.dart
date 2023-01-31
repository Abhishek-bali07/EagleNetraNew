// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashBoardPageViewModel on _DashBoardPageViewModel, Store {
  late final _$isShowAtom =
      Atom(name: '_DashBoardPageViewModel.isShow', context: context);

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

  late final _$isLoaderAtom =
      Atom(name: '_DashBoardPageViewModel.isLoader', context: context);

  @override
  bool get isLoader {
    _$isLoaderAtom.reportRead();
    return super.isLoader;
  }

  @override
  set isLoader(bool value) {
    _$isLoaderAtom.reportWrite(value, super.isLoader, () {
      super.isLoader = value;
    });
  }

  late final _$isCallingAtom =
      Atom(name: '_DashBoardPageViewModel.isCalling', context: context);

  @override
  bool get isCalling {
    _$isCallingAtom.reportRead();
    return super.isCalling;
  }

  @override
  set isCalling(bool value) {
    _$isCallingAtom.reportWrite(value, super.isCalling, () {
      super.isCalling = value;
    });
  }

  late final _$markersAtom =
      Atom(name: '_DashBoardPageViewModel.markers', context: context);

  @override
  ObservableSet<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(ObservableSet<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  late final _$isVisibleAtom =
      Atom(name: '_DashBoardPageViewModel.isVisible', context: context);

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(value, super.isVisible, () {
      super.isVisible = value;
    });
  }

  late final _$kidNameAtom =
      Atom(name: '_DashBoardPageViewModel.kidName', context: context);

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

  late final _$currentDateAtom =
      Atom(name: '_DashBoardPageViewModel.currentDate', context: context);

  @override
  String get currentDate {
    _$currentDateAtom.reportRead();
    return super.currentDate;
  }

  @override
  set currentDate(String value) {
    _$currentDateAtom.reportWrite(value, super.currentDate, () {
      super.currentDate = value;
    });
  }

  late final _$callingNumberAtom =
      Atom(name: '_DashBoardPageViewModel.callingNumber', context: context);

  @override
  String get callingNumber {
    _$callingNumberAtom.reportRead();
    return super.callingNumber;
  }

  @override
  set callingNumber(String value) {
    _$callingNumberAtom.reportWrite(value, super.callingNumber, () {
      super.callingNumber = value;
    });
  }

  late final _$currentTimeAtom =
      Atom(name: '_DashBoardPageViewModel.currentTime', context: context);

  @override
  String get currentTime {
    _$currentTimeAtom.reportRead();
    return super.currentTime;
  }

  @override
  set currentTime(String value) {
    _$currentTimeAtom.reportWrite(value, super.currentTime, () {
      super.currentTime = value;
    });
  }

  late final _$batteryAtom =
      Atom(name: '_DashBoardPageViewModel.battery', context: context);

  @override
  String get battery {
    _$batteryAtom.reportRead();
    return super.battery;
  }

  @override
  set battery(String value) {
    _$batteryAtom.reportWrite(value, super.battery, () {
      super.battery = value;
    });
  }

  late final _$deviceConditionAtom =
      Atom(name: '_DashBoardPageViewModel.deviceCondition', context: context);

  @override
  String get deviceCondition {
    _$deviceConditionAtom.reportRead();
    return super.deviceCondition;
  }

  @override
  set deviceCondition(String value) {
    _$deviceConditionAtom.reportWrite(value, super.deviceCondition, () {
      super.deviceCondition = value;
    });
  }

  late final _$imageAtom =
      Atom(name: '_DashBoardPageViewModel.image', context: context);

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

  late final _$selectedImageAtom =
      Atom(name: '_DashBoardPageViewModel.selectedImage', context: context);

  @override
  File? get selectedImage {
    _$selectedImageAtom.reportRead();
    return super.selectedImage;
  }

  @override
  set selectedImage(File? value) {
    _$selectedImageAtom.reportWrite(value, super.selectedImage, () {
      super.selectedImage = value;
    });
  }

  late final _$locationAddressAtom =
      Atom(name: '_DashBoardPageViewModel.locationAddress', context: context);

  @override
  String get locationAddress {
    _$locationAddressAtom.reportRead();
    return super.locationAddress;
  }

  @override
  set locationAddress(String value) {
    _$locationAddressAtom.reportWrite(value, super.locationAddress, () {
      super.locationAddress = value;
    });
  }

  late final _$setupMarkerAsyncAction =
      AsyncAction('_DashBoardPageViewModel.setupMarker', context: context);

  @override
  Future setupMarker(LatLong coordinate, String posId) {
    return _$setupMarkerAsyncAction
        .run(() => super.setupMarker(coordinate, posId));
  }

  late final _$openBottomSheetAsyncAction =
      AsyncAction('_DashBoardPageViewModel.openBottomSheet', context: context);

  @override
  Future openBottomSheet() {
    return _$openBottomSheetAsyncAction.run(() => super.openBottomSheet());
  }

  late final _$onNextAsyncAction =
      AsyncAction('_DashBoardPageViewModel.onNext', context: context);

  @override
  Future onNext(String posId) {
    return _$onNextAsyncAction.run(() => super.onNext(posId));
  }

  late final _$_DashBoardPageViewModelActionController =
      ActionController(name: '_DashBoardPageViewModel', context: context);

  @override
  dynamic onRetry(AlertAction? action) {
    final _$actionInfo = _$_DashBoardPageViewModelActionController.startAction(
        name: '_DashBoardPageViewModel.onRetry');
    try {
      return super.onRetry(action);
    } finally {
      _$_DashBoardPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isShow: ${isShow},
isLoader: ${isLoader},
isCalling: ${isCalling},
markers: ${markers},
isVisible: ${isVisible},
kidName: ${kidName},
currentDate: ${currentDate},
callingNumber: ${callingNumber},
currentTime: ${currentTime},
battery: ${battery},
deviceCondition: ${deviceCondition},
image: ${image},
selectedImage: ${selectedImage},
locationAddress: ${locationAddress}
    ''';
  }
}
