import 'package:flutter/cupertino.dart';

class NavigationServiceImpl extends NavigationService {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<dynamic>? popAndNavigateTo(String routeName,
      {dynamic arguments}) async {
    return await navigatorKey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic>? navigateTo(String routeName, {dynamic arguments}) async {
    return await navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  @override
  pop({Object? result}) => navigatorKey.currentState?.pop(result);
}

abstract class NavigationService {
  GlobalKey<NavigatorState> get navigatorKey;
  Future<dynamic>? navigateTo(String routeName, {dynamic arguments});
  Future<dynamic>? popAndNavigateTo(String routeName, {dynamic arguments});
  pop({Object? result});
}
