import 'package:eagle_netra/core/common/routeGenerator.dart';
import 'package:eagle_netra/core/helpers/navigation_service.dart';
import 'package:eagle_netra/presentation/app_navigator/di.dart';
import 'package:eagle_netra/presentation/app_navigator/routes.dart';
import 'package:eagle_netra/utils/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428,926),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            color: Colors.red,
            debugShowCheckedModeBanner: false,
           navigatorKey: instance<NavigationService>().navigatorKey,
            //initialRoute: Routes.splash,
            initialRoute: Routes.dashboard,
            onGenerateRoute: RouteGenerator.getRoute);
      });
  }
}



