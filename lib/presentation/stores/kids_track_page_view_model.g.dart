// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kids_track_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KidsTrackPageViewModel on _KidsTrackPageViewModel, Store {
  late final _$processAtom =
      Atom(name: '_KidsTrackPageViewModel.process', context: context);

  @override
  List<String> get process {
    _$processAtom.reportRead();
    return super.process;
  }

  @override
  set process(List<String> value) {
    _$processAtom.reportWrite(value, super.process, () {
      super.process = value;
    });
  }

  late final _$markersAtom =
      Atom(name: '_KidsTrackPageViewModel.markers', context: context);

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

  late final _$datesSelectedListLoaderAtom = Atom(
      name: '_KidsTrackPageViewModel.datesSelectedListLoader',
      context: context);

  @override
  bool get datesSelectedListLoader {
    _$datesSelectedListLoaderAtom.reportRead();
    return super.datesSelectedListLoader;
  }

  @override
  set datesSelectedListLoader(bool value) {
    _$datesSelectedListLoaderAtom
        .reportWrite(value, super.datesSelectedListLoader, () {
      super.datesSelectedListLoader = value;
    });
  }

  late final _$dateAtom =
      Atom(name: '_KidsTrackPageViewModel.date', context: context);

  @override
  String get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$timeAtom =
      Atom(name: '_KidsTrackPageViewModel.time', context: context);

  @override
  String get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(String value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$startTimeAtom =
      Atom(name: '_KidsTrackPageViewModel.startTime', context: context);

  @override
  String get startTime {
    _$startTimeAtom.reportRead();
    return super.startTime;
  }

  @override
  set startTime(String value) {
    _$startTimeAtom.reportWrite(value, super.startTime, () {
      super.startTime = value;
    });
  }

  late final _$endTimeAtom =
      Atom(name: '_KidsTrackPageViewModel.endTime', context: context);

  @override
  String get endTime {
    _$endTimeAtom.reportRead();
    return super.endTime;
  }

  @override
  set endTime(String value) {
    _$endTimeAtom.reportWrite(value, super.endTime, () {
      super.endTime = value;
    });
  }

  late final _$imageAtom =
      Atom(name: '_KidsTrackPageViewModel.image', context: context);

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

  late final _$enableBtnAtom =
      Atom(name: '_KidsTrackPageViewModel.enableBtn', context: context);

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

  late final _$isVisibleAtom =
      Atom(name: '_KidsTrackPageViewModel.isVisible', context: context);

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

  late final _$initialDataAsyncAction =
      AsyncAction('_KidsTrackPageViewModel.initialData', context: context);

  @override
  Future initialData() {
    return _$initialDataAsyncAction.run(() => super.initialData());
  }

  late final _$setupMarkerAsyncAction =
      AsyncAction('_KidsTrackPageViewModel.setupMarker', context: context);

  @override
  Future setupMarker(LatLong coordinate, String posId, String positionalTime) {
    return _$setupMarkerAsyncAction
        .run(() => super.setupMarker(coordinate, posId, positionalTime));
  }

  late final _$validateBtnAsyncAction =
      AsyncAction('_KidsTrackPageViewModel.validateBtn', context: context);

  @override
  Future validateBtn() {
    return _$validateBtnAsyncAction.run(() => super.validateBtn());
  }

  late final _$_KidsTrackPageViewModelActionController =
      ActionController(name: '_KidsTrackPageViewModel', context: context);

  @override
  dynamic currentDate() {
    final _$actionInfo = _$_KidsTrackPageViewModelActionController.startAction(
        name: '_KidsTrackPageViewModel.currentDate');
    try {
      return super.currentDate();
    } finally {
      _$_KidsTrackPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic rangeStart(BuildContext context, TimeOfDay timeOfDay) {
    final _$actionInfo = _$_KidsTrackPageViewModelActionController.startAction(
        name: '_KidsTrackPageViewModel.rangeStart');
    try {
      return super.rangeStart(context, timeOfDay);
    } finally {
      _$_KidsTrackPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic rangeEnd(BuildContext context, TimeOfDay timeOfDay) {
    final _$actionInfo = _$_KidsTrackPageViewModelActionController.startAction(
        name: '_KidsTrackPageViewModel.rangeEnd');
    try {
      return super.rangeEnd(context, timeOfDay);
    } finally {
      _$_KidsTrackPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSelectDate(DateTime? selected) {
    final _$actionInfo = _$_KidsTrackPageViewModelActionController.startAction(
        name: '_KidsTrackPageViewModel.onSelectDate');
    try {
      return super.onSelectDate(selected);
    } finally {
      _$_KidsTrackPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSelectStartTime(TimeOfDay selectedstarttime) {
    final _$actionInfo = _$_KidsTrackPageViewModelActionController.startAction(
        name: '_KidsTrackPageViewModel.onSelectStartTime');
    try {
      return super.onSelectStartTime(selectedstarttime);
    } finally {
      _$_KidsTrackPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSelectEndTime(TimeOfDay selectedendtime) {
    final _$actionInfo = _$_KidsTrackPageViewModelActionController.startAction(
        name: '_KidsTrackPageViewModel.onSelectEndTime');
    try {
      return super.onSelectEndTime(selectedendtime);
    } finally {
      _$_KidsTrackPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
process: ${process},
markers: ${markers},
datesSelectedListLoader: ${datesSelectedListLoader},
date: ${date},
time: ${time},
startTime: ${startTime},
endTime: ${endTime},
image: ${image},
enableBtn: ${enableBtn},
isVisible: ${isVisible}
    ''';
  }
}
