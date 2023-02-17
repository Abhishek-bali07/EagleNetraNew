import 'package:eagle_netra/presentation/app_navigator/routes.dart';
import 'package:eagle_netra/presentation/app_navigator/screen_transitions.dart';
import 'package:eagle_netra/presentation/screens/mobileInput_page.dart';
import 'package:eagle_netra/presentation/screens/slider_page.dart';
import 'package:eagle_netra/presentation/screens/splash_page.dart';
import 'package:flutter/cupertino.dart';

import '../../presentation/screens/access_management_page.dart';
import '../../presentation/screens/add_kids.dart';
import '../../presentation/screens/add_safe_area.dart';
import '../../presentation/screens/device_subscrption_page.dart';
import '../../presentation/screens/kidsPage.dart';
import '../../presentation/screens/kids_history.dart';
import '../../presentation/screens/kids_track_page.dart';
import '../../presentation/screens/management_page.dart';
import '../../presentation/screens/my_kids.dart';
import '../../presentation/screens/dasboard_page.dart';
import '../../presentation/screens/registration_page.dart';
import '../../presentation/screens/safeAreaPage.dart';
import '../../presentation/screens/subscription_page.dart';
import '../../presentation/screens/support.dart';
import '../domain/response/kid_short_info_response.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    Widget page;
    switch (routeSettings.name) {
      case Routes.splash:
        return  ScreenTransitions.rightToLeftTransition(const SplashPage());

      case Routes.slider:
        debugPrint("navigatetoslider");
        return ScreenTransitions.rightToLeftTransition(SliderPage());

      case Routes.mobileinput:
        return ScreenTransitions.rightToLeftTransition(MobileInput());

      case Routes.registration:
        return ScreenTransitions.rightToLeftTransition(const RegistrationPage());
      
      case Routes.dashboard: 
        return ScreenTransitions.rightToLeftTransition(const DashboardPage());


      case Routes.mykids:
        return ScreenTransitions.rightToLeftTransition(const MyKidsScreen());


      case Routes.addkid:
        return ScreenTransitions.rightToLeftTransition(const AddKidScreen());

      case Routes.kidPage:
        return ScreenTransitions.rightToLeftTransition(const KidsPage());

      case Routes.safearea:
        var arg = routeSettings.arguments as ShortDetails;
        return ScreenTransitions.rightToLeftTransition(SafeAreaPage(arguments: arg));

      case Routes.addsafearea:
          var arg = routeSettings.arguments as ShortDetails;
          return ScreenTransitions.rightToLeftTransition(AddSafeaAreaPage(arguments: arg));

      case Routes.kidsHistory:
        return ScreenTransitions.rightToLeftTransition(const KidsHistory());


      case Routes.kidstrack:
        var arg = routeSettings.arguments as ShortDetails;
        print("$arg");
        return ScreenTransitions.rightToLeftTransition(KidsTrackPage(arguments: arg));



      case Routes.accessmanagement:
        return ScreenTransitions.rightToLeftTransition(const AccessManagementPage());


      case Routes.management:
        return ScreenTransitions.rightToLeftTransition(const ManagementAccessPage());

      case Routes.subscription:
        return ScreenTransitions.rightToLeftTransition( const SubscriptionPage());


      case Routes.support:
        return ScreenTransitions.rightToLeftTransition(const SupportPage());

      default:
        page = const Text("Undefined route");
        break;
    }
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,

    );
  }

}