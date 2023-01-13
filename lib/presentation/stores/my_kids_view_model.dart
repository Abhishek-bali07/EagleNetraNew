import 'package:mobx/mobx.dart';

import '../../core/helpers/navigation_service.dart';
import '../app_navigator/di.dart';
import '../app_navigator/routes.dart';



part 'my_kids_view_model.g.dart';

class MyKidsViewModel = _MyKidsViewModel  with _$MyKidsViewModel;


abstract class _MyKidsViewModel with Store{
  final _navigator = instance<NavigationService>();






  onAddkidSection(){
    _navigator.navigateTo(Routes.addkid);
  }

}