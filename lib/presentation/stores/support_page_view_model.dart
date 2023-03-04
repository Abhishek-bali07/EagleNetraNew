import 'package:eagle_netra/presentation/app_navigator/routes.dart';
import 'package:mobx/mobx.dart';

import '../../core/helpers/navigation_service.dart';
import '../../utils/dialog_manager.dart';
import '../app_navigator/di.dart';
part 'support_page_view_model.g.dart';

class SupportPageViewModel = _SupportPageViewModel with _$SupportPageViewModel;

abstract class _SupportPageViewModel with Store{
  final dialogManager = DialogManager();
  final _navigator = instance<NavigationService>();




  backToPrevious(){
   _navigator.pop();
    // _navigator.popAndNavigateTo(Routes.dashboard);
  }
}