// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_safe_area_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddSafeAreaPageViewModel on _AddSafeAreaPageViewModel, Store {
  late final _$gettingDataLoaderAtom = Atom(
      name: '_AddSafeAreaPageViewModel.gettingDataLoader', context: context);

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
      Atom(name: '_AddSafeAreaPageViewModel.sendingLoader', context: context);

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
      Atom(name: '_AddSafeAreaPageViewModel.isShow', context: context);

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

  late final _$markersAtom =
      Atom(name: '_AddSafeAreaPageViewModel.markers', context: context);

  @override
  Set<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(Set<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  late final _$circlesAtom =
      Atom(name: '_AddSafeAreaPageViewModel.circles', context: context);

  @override
  Set<Circle> get circles {
    _$circlesAtom.reportRead();
    return super.circles;
  }

  @override
  set circles(Set<Circle> value) {
    _$circlesAtom.reportWrite(value, super.circles, () {
      super.circles = value;
    });
  }

  late final _$alertSelectedAtom =
      Atom(name: '_AddSafeAreaPageViewModel.alertSelected', context: context);

  @override
  String get alertSelected {
    _$alertSelectedAtom.reportRead();
    return super.alertSelected;
  }

  @override
  set alertSelected(String value) {
    _$alertSelectedAtom.reportWrite(value, super.alertSelected, () {
      super.alertSelected = value;
    });
  }

  late final _$uploadingLoaderAtom =
      Atom(name: '_AddSafeAreaPageViewModel.uploadingLoader', context: context);

  @override
  bool get uploadingLoader {
    _$uploadingLoaderAtom.reportRead();
    return super.uploadingLoader;
  }

  @override
  set uploadingLoader(bool value) {
    _$uploadingLoaderAtom.reportWrite(value, super.uploadingLoader, () {
      super.uploadingLoader = value;
    });
  }

  late final _$isLoaderAtom =
      Atom(name: '_AddSafeAreaPageViewModel.isLoader', context: context);

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

  late final _$locationAddressAtom =
      Atom(name: '_AddSafeAreaPageViewModel.locationAddress', context: context);

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

  late final _$locationNameAtom =
      Atom(name: '_AddSafeAreaPageViewModel.locationName', context: context);

  @override
  String get locationName {
    _$locationNameAtom.reportRead();
    return super.locationName;
  }

  @override
  set locationName(String value) {
    _$locationNameAtom.reportWrite(value, super.locationName, () {
      super.locationName = value;
    });
  }

  late final _$radiusAtom =
      Atom(name: '_AddSafeAreaPageViewModel.radius', context: context);

  @override
  double get radius {
    _$radiusAtom.reportRead();
    return super.radius;
  }

  @override
  set radius(double value) {
    _$radiusAtom.reportWrite(value, super.radius, () {
      super.radius = value;
    });
  }

  late final _$valuefirstAtom =
      Atom(name: '_AddSafeAreaPageViewModel.valuefirst', context: context);

  @override
  bool get valuefirst {
    _$valuefirstAtom.reportRead();
    return super.valuefirst;
  }

  @override
  set valuefirst(bool value) {
    _$valuefirstAtom.reportWrite(value, super.valuefirst, () {
      super.valuefirst = value;
    });
  }

  late final _$valuesecondAtom =
      Atom(name: '_AddSafeAreaPageViewModel.valuesecond', context: context);

  @override
  bool get valuesecond {
    _$valuesecondAtom.reportRead();
    return super.valuesecond;
  }

  @override
  set valuesecond(bool value) {
    _$valuesecondAtom.reportWrite(value, super.valuesecond, () {
      super.valuesecond = value;
    });
  }

  late final _$setupMarkerAsyncAction =
      AsyncAction('_AddSafeAreaPageViewModel.setupMarker', context: context);

  @override
  Future setupMarker(LatLong coordinate) {
    return _$setupMarkerAsyncAction.run(() => super.setupMarker(coordinate));
  }

  late final _$onNextAsyncAction =
      AsyncAction('_AddSafeAreaPageViewModel.onNext', context: context);

  @override
  Future onNext() {
    return _$onNextAsyncAction.run(() => super.onNext());
  }

  late final _$getLocationNameAsyncAction = AsyncAction(
      '_AddSafeAreaPageViewModel.getLocationName',
      context: context);

  @override
  Future getLocationName(LatLong coordinate) {
    return _$getLocationNameAsyncAction
        .run(() => super.getLocationName(coordinate));
  }

  late final _$addNowAsyncAction =
      AsyncAction('_AddSafeAreaPageViewModel.addNow', context: context);

  @override
  Future addNow() {
    return _$addNowAsyncAction.run(() => super.addNow());
  }

  late final _$_AddSafeAreaPageViewModelActionController =
      ActionController(name: '_AddSafeAreaPageViewModel', context: context);

  @override
  dynamic onNameChanged(String value) {
    final _$actionInfo = _$_AddSafeAreaPageViewModelActionController
        .startAction(name: '_AddSafeAreaPageViewModel.onNameChanged');
    try {
      return super.onNameChanged(value);
    } finally {
      _$_AddSafeAreaPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onRetry(AlertAction? action) {
    final _$actionInfo = _$_AddSafeAreaPageViewModelActionController
        .startAction(name: '_AddSafeAreaPageViewModel.onRetry');
    try {
      return super.onRetry(action);
    } finally {
      _$_AddSafeAreaPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setupCircle(LatLong coordinate) {
    final _$actionInfo = _$_AddSafeAreaPageViewModelActionController
        .startAction(name: '_AddSafeAreaPageViewModel.setupCircle');
    try {
      return super.setupCircle(coordinate);
    } finally {
      _$_AddSafeAreaPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRadius(double r) {
    final _$actionInfo = _$_AddSafeAreaPageViewModelActionController
        .startAction(name: '_AddSafeAreaPageViewModel.setRadius');
    try {
      return super.setRadius(r);
    } finally {
      _$_AddSafeAreaPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onCheckFirst(bool? value) {
    final _$actionInfo = _$_AddSafeAreaPageViewModelActionController
        .startAction(name: '_AddSafeAreaPageViewModel.onCheckFirst');
    try {
      return super.onCheckFirst(value);
    } finally {
      _$_AddSafeAreaPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onCheckSecond(bool? value) {
    final _$actionInfo = _$_AddSafeAreaPageViewModelActionController
        .startAction(name: '_AddSafeAreaPageViewModel.onCheckSecond');
    try {
      return super.onCheckSecond(value);
    } finally {
      _$_AddSafeAreaPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gettingDataLoader: ${gettingDataLoader},
sendingLoader: ${sendingLoader},
isShow: ${isShow},
markers: ${markers},
circles: ${circles},
alertSelected: ${alertSelected},
uploadingLoader: ${uploadingLoader},
isLoader: ${isLoader},
locationAddress: ${locationAddress},
locationName: ${locationName},
radius: ${radius},
valuefirst: ${valuefirst},
valuesecond: ${valuesecond}
    ''';
  }
}
