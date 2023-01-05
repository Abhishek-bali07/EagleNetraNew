import 'package:eagle_netra/core/common/alert_action.dart';
import 'package:eagle_netra/core/common/alert_data.dart';
import 'package:eagle_netra/core/common/dialog_state.dart';
import 'package:eagle_netra/core/helpers/my_dialog.dart';
import 'package:flutter/widgets.dart';


class DialogController {
  MyDialog dialog;
  DialogController({required this.dialog});

  Future show(AlertData alertData, DialogState state,
      {Function(AlertAction?)? positive,
        Function(AlertAction?)? negative,
        Function? close}) async {
    await dialog.show(alertData, state,
        onPositive: positive, onNegative: negative, close: close);
  }

  Future showWithCustomData(AlertData data, DialogState state, Widget ui,
      {Function? close}) async {
    await dialog.showWithCustomData(data, state, ui, close: close);
  }
}
