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
import '../../core/repository/access_management_repository.dart';
import '../../core/repository/addKids_repository.dart';
import '../../core/repository/dashboard_page_repository.dart';
import '../../core/repository/kid_live_location_repository.dart';
import '../../core/repository/kid_repository.dart';
import '../../core/repository/kids_track_repository.dart';
import '../../core/repository/kidshistory_repository.dart';
import '../../core/repository/management_history_repository.dart';
import '../../core/repository/safearea_details_repository.dart';
import '../../core/repository/safearea_repository.dart';
import '../../core/repository/subscription_repository.dart';
import '../../core/repository/userRegister_repository.dart';
import '../../helpers_impl/validator_impl.dart';
import '../../repository_impl/access_management_repository_impl.dart';
import '../../repository_impl/addKids_repository_impl.dart';
import '../../repository_impl/dashboard_page_repository_impl.dart';
import '../../repository_impl/kid_live_location_repository_impl.dart';
import '../../repository_impl/kid_repository_impl.dart';
import '../../repository_impl/kidhistory_repository_impl.dart';
import '../../repository_impl/kids_track_repository_impl.dart';
import '../../repository_impl/management_history_repository_impl.dart';
import '../../repository_impl/safearea_details_repository_impl.dart';
import '../../repository_impl/safearea_repository_impl.dart';
import '../../repository_impl/subscription_repository_impl.dart';
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
  instance.registerLazySingleton<NavigationService>(() => NavigationServiceImpl());

  instance.registerLazySingleton<Environment>(() => env);

  alice.setNavigatorKey(instance<NavigationService>().navigatorKey);
 // alice.setNavigatorKey(NavigationServiceImpl().navigatorKey);
  dio.interceptors.add(alice.getDioInterceptor());

  instance.registerLazySingleton<AppSettings>(() => AppSettingsImpl(sharedPrefs));

  instance.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl(dio));



 // instance.registerLazySingleton<>(() => ());

  instance.registerLazySingleton<Validator>(() => ValidatorImpl());

  instance.registerLazySingleton<MobileInputRepository>(() => MobileInputRepositoryImpl(dio));


  instance.registerLazySingleton<RegisterUserRepository>(() => RegisterUserUseCaseImpl(dio));


  instance.registerLazySingleton<AddCardRepository>(() => AddKidsUseCaseImpl(dio));

  instance.registerLazySingleton<KidAccountRepository>(() => KidRepositoryImpl(dio));


  instance.registerLazySingleton<SafeAreaRepository>(() => SafeareaRepositoryImpl(dio));

  instance.registerLazySingleton<KidLiveLocationRepository>(() => KidLiveLocationRepositoryImpl());

  instance.registerLazySingleton<SafeAreaDetailsRepository>(() => SafeareaDetailsUseCaseImpl(dio));

  instance.registerLazySingleton<DashboardPageRepository>(() => DashboardPageUseCaseImpl(dio));

  instance.registerLazySingleton<KidsHistoryRepository>(() => KidsHistoryRepositoryImpl(dio));

  instance.registerLazySingleton<KidsTrackRepository>(() => KidsTrackRepositoryImpl(dio));

  instance.registerLazySingleton<AccessManagementRepository>(() => AddAccessManagementUseCaseImpl());

  instance.registerLazySingleton<ManagementHistoryRepository>(() => ManagementHistoryRepositoryImpl());

  instance.registerLazySingleton<SubscriptionRepository>(() => SubscriptionRepositoryImpl());

}