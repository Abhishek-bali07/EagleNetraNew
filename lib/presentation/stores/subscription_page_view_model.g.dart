// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SubscriptionPageViewModel on _SubscriptionPageViewModel, Store {
  late final _$subscrptionHistoryAtom = Atom(
      name: '_SubscriptionPageViewModel.subscrptionHistory', context: context);

  @override
  List<SubscriptionDetails> get subscrptionHistory {
    _$subscrptionHistoryAtom.reportRead();
    return super.subscrptionHistory;
  }

  @override
  set subscrptionHistory(List<SubscriptionDetails> value) {
    _$subscrptionHistoryAtom.reportWrite(value, super.subscrptionHistory, () {
      super.subscrptionHistory = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SubscriptionPageViewModel.isLoading', context: context);

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
      Atom(name: '_SubscriptionPageViewModel.kidName', context: context);

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
      Atom(name: '_SubscriptionPageViewModel.kidClass', context: context);

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
      Atom(name: '_SubscriptionPageViewModel.Rmessage', context: context);

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
      Atom(name: '_SubscriptionPageViewModel.image', context: context);

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

  late final _$amountAtom =
      Atom(name: '_SubscriptionPageViewModel.amount', context: context);

  @override
  String get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(String value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  late final _$expireDateAtom =
      Atom(name: '_SubscriptionPageViewModel.expireDate', context: context);

  @override
  String get expireDate {
    _$expireDateAtom.reportRead();
    return super.expireDate;
  }

  @override
  set expireDate(String value) {
    _$expireDateAtom.reportWrite(value, super.expireDate, () {
      super.expireDate = value;
    });
  }

  late final _$getInitialDataAsyncAction = AsyncAction(
      '_SubscriptionPageViewModel.getInitialData',
      context: context);

  @override
  Future getInitialData() {
    return _$getInitialDataAsyncAction.run(() => super.getInitialData());
  }

  @override
  String toString() {
    return '''
subscrptionHistory: ${subscrptionHistory},
isLoading: ${isLoading},
kidName: ${kidName},
kidClass: ${kidClass},
Rmessage: ${Rmessage},
image: ${image},
amount: ${amount},
expireDate: ${expireDate}
    ''';
  }
}
