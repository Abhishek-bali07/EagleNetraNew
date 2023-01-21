// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_safe_area_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddSafeAreaPageViewModel on _AddSafeAreaPageViewModel, Store {
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

  late final _$_AddSafeAreaPageViewModelActionController =
      ActionController(name: '_AddSafeAreaPageViewModel', context: context);

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
  dynamic setupMarker(LatLong coordinate) {
    final _$actionInfo = _$_AddSafeAreaPageViewModelActionController
        .startAction(name: '_AddSafeAreaPageViewModel.setupMarker');
    try {
      return super.setupMarker(coordinate);
    } finally {
      _$_AddSafeAreaPageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
markers: ${markers},
circles: ${circles}
    ''';
  }
}
