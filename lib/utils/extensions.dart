import 'dart:async';

import 'package:dio/dio.dart';
import 'package:eagle_netra/core/domain/response/business_object.dart';
import 'package:eagle_netra/presentation/nested_screens/intro_one.dart';
import 'package:eagle_netra/presentation/nested_screens/intro_three.dart';
import 'package:eagle_netra/presentation/nested_screens/intro_two.dart';
import 'package:eagle_netra/presentation/stores/slider_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/common/response.dart';

extension SliderPage on int {
  Widget getIntroPage() {
    switch (this) {
      case 0:
        return IntroOne();
      case 1:
        return IntroTwo( pos: this);
      case 2:
        return IntroThree(pos: this);
    }
    return const SizedBox.shrink();
  }
}


extension MyText on String {
  Widget text(
      [TextStyle? textStyle, TextOverflow? textOverflow, TextAlign? align]) {
    return Text(
      this.tr(),
      style: textStyle,
      overflow: textOverflow,
      textAlign: align,
    );
  }
}


extension MyPadding on Widget {
  Widget padding({required EdgeInsets insets}) {
    return Padding(
      padding: insets,
      child: this,
    );
  }
}

extension MyFittedBox on Object {
  Widget fitBox({BoxFit fit = BoxFit.contain, required Widget child}) {
    return FittedBox(
      fit: fit,
      child: child,
    );
  }
}

extension MyExpanded on Object {
  Widget expand({required int flex, required Widget child}) {
    return Expanded(flex: flex, child: child);
  }
}


class DialogTrigger {
  DialogTrigger({this.controlData = null});

  final dynamic controlData;
  void Function(dynamic) callback = (_) {};
}

Future triggerDialog(Function(DialogTrigger) builder, {dynamic value}) {
  Completer completer = Completer();
  var d = DialogTrigger(controlData: value)
    ..callback = (result) {
      completer.complete(result);
    };
  builder(d);
  return completer.future;
}


showMyDialog(
    DialogTrigger dialogTrigger, BuildContext context, WidgetBuilder builder,
    {bool barrierDismissible = false}) {
  /*showDialog(
    context: context,
    builder: (BuildContext context) {
      return builder(context);
    },
  ).then((result){
    dialogTrigger.callback(result);
  });*/

  showGeneralDialog(
    barrierLabel: "Dialog",
    barrierDismissible: barrierDismissible,
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return builder(ctx);
    },
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeInOut.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 400),
  ).then((result) {
    dialogTrigger.callback(result);
  });



}
extension MyApiCall on Future<BusinessObject> {
  Future<Resource<R>> handleResponse<R>() async {
    try {
      var result = await this;
      return Success(result as R);
    } on DioError catch (ex) {
      switch (ex.type) {
        case DioErrorType.connectTimeout:
          return Error(message: ex.message);
        case DioErrorType.sendTimeout:
          return Error(message: ex.message);
        case DioErrorType.receiveTimeout:
          return Error(message: ex.message);
        case DioErrorType.response:
          return Error(message: ex.message);
        case DioErrorType.cancel:
          return Error(message: ex.message);
        case DioErrorType.other:
          return Error(message: ex.message);
      }
    }
  }
}
