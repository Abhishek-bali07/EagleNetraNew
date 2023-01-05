import 'package:eagle_netra/core/common/alert_action.dart';
import 'package:eagle_netra/core/common/alert_option.dart';


class AlertBehaviour {
  AlertOption option;
  AlertAction action;
  bool isDismissable;

  AlertBehaviour({required this.option, required this.action, this.isDismissable = true});
}
