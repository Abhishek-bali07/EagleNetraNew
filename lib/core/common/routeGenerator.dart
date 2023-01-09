import 'package:eagle_netra/presentation/app_navigator/routes.dart';
import 'package:eagle_netra/presentation/app_navigator/screen_transitions.dart';
import 'package:eagle_netra/presentation/screens/mobileInput_page.dart';
import 'package:eagle_netra/presentation/screens/slider_page.dart';
import 'package:eagle_netra/presentation/screens/splash_page.dart';
import 'package:flutter/cupertino.dart';

import '../../presentation/screens/dasboard_page.dart';
import '../../presentation/screens/registration_page.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    Widget page;
    switch (routeSettings.name) {
      case Routes.splash:
        return  ScreenTransitions.rightToLeftTransition(const SplashPage());

      case Routes.slider:
        return ScreenTransitions.rightToLeftTransition(const SliderPage());

      case Routes.mobileinput:
        return ScreenTransitions.rightToLeftTransition(MobileInput());

      case Routes.registration:
        return ScreenTransitions.rightToLeftTransition(const RegistrationPage());
      
      case Routes.dashboard: 
        return ScreenTransitions.rightToLeftTransition(const DashboardPage());

      default:
        page = const Text("Undefined route");
        break;
    }
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,

    );
  }

}