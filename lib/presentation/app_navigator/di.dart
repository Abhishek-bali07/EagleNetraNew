import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:eagle_netra/core/common/app_settings.dart';
import 'package:eagle_netra/core/helpers/navigation_service.dart';
import 'package:eagle_netra/core/repository/main_repository.dart';
import 'package:eagle_netra/core/repository/mobile_input_repository.dart';
import 'package:eagle_netra/core/repository/splash_repository.dart';
import 'package:eagle_netra/presentation/stores/main_view_model.dart';
import 'package:eagle_netra/repository_impl/app_setting_impl.dart';
import 'package:eagle_netra/repository_impl/main_repository_impl.dart';
import 'package:eagle_netra/repository_impl/mobile_input_repository_impl.dart';
import 'package:eagle_netra/repository_impl/splash_repository_impl.dart';
import 'package:eagle_netra/utils/api_client_configuration.dart';
import 'package:eagle_netra/utils/environment.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/common/validator.dart';
import '../../core/repository/userRegister_repository.dart';
import '../../helpers_impl/validator_impl.dart';
import '../../repository_impl/userRegister_repository_impl.dart';

final instance = GetIt.instance;

final alice = Alice(
  showNotification: true,
  showInspectorOnShake: true,
  darkTheme: false,
);


Future<void> initAppModule() async{
  final  sharedPrefs = await SharedPreferences.getInstance();
  final env = Environment();
  await env.init();
  await ApiClientConfiguration.init(env.apiKey, env.staticBaseUrl);
  final dio = Dio(ApiClientConfiguration.initialConfiguration);


  instance.registerLazySingleton<MainRepository>(() => MainRepositoryImpl());

  instance.registerLazySingleton<MainViewModel>(() => MainViewModel());

  instance.registerLazySingleton<Environment>(() => env);

  //alice.setNavigatorKey(instance<NavigationService>().navigatorKey);

  dio.interceptors.add(alice.getDioInterceptor());

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance.registerLazySingleton<AppSettings>(() => AppSettingsImpl(instance()));

  instance.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl());

  instance.registerLazySingleton<NavigationService>(() => NavigationServiceImpl());

 // instance.registerLazySingleton<>(() => ());

  instance.registerLazySingleton<Validator>(() => ValidatorImpl());

  instance.registerLazySingleton<MobileInputRepository>(() => MobileInputRepositoryImpl());


  instance.registerLazySingleton<RegisterUserRepository>(() => RegisterUserUseCaseImpl());

}