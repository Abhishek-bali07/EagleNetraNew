import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../core/common/alert_action.dart';
import '../../core/common/alert_behaviour.dart';
import '../../core/common/alert_data.dart';
import '../../core/common/alert_option.dart';
import '../../core/common/dialog_state.dart';
import '../../core/helpers/my_dialog.dart';


class ErrorDialogImpl implements MyDialog {
  BuildContext buildContext;

  ErrorDialogImpl({required this.buildContext});

  @override
  Future show(AlertData data, DialogState state,
      {Function(AlertAction?)? onPositive,
        Function(AlertAction?)? onNegative,
        Function? close}) {
    // TODO: implement show
    throw UnimplementedError();
  }

  @override
  Future showWithCustomData(AlertData data, DialogState state, Widget ui, {Function? close}) {

    throw UnimplementedError();
  }


}
