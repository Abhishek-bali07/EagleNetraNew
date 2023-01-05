import 'package:eagle_netra/core/common/alert_data.dart';
import 'package:flutter/material.dart';
import '../common/alert_action.dart';
import '../common/dialog_state.dart';

abstract class MyDialog {
  Future show(AlertData data, DialogState state,
      {Function(AlertAction?)? onPositive,
        Function(AlertAction?)? onNegative,
        Function? close});

  Future showWithCustomData(AlertData data, DialogState state, Widget ui,
      {Function? close});
}
