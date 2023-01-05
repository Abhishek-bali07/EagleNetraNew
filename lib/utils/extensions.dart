import 'package:eagle_netra/presentation/nested_screens/intro_one.dart';
import 'package:eagle_netra/presentation/nested_screens/intro_three.dart';
import 'package:eagle_netra/presentation/nested_screens/intro_two.dart';
import 'package:eagle_netra/presentation/stores/slider_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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

