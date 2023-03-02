import 'package:eagle_netra/core/common/app_settings.dart';
import 'package:eagle_netra/core/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsImpl extends AppSettings {
  SharedPreferences sharedPreferences;

  AppSettingsImpl(this.sharedPreferences);

  @override
  get userId => sharedPreferences.get(Constants.userId);

  @override
  setBaseUrl(String baseUrl) {
    sharedPreferences.setString(Constants.baseUrl, baseUrl);
  }

  @override
  String get baseUrl => sharedPreferences.getString(Constants.baseUrl) ?? "";

  @override
  introComplete(bool value) {
    sharedPreferences.setBool(Constants.intro_done_key, value);
  }

  @override
  bool isIntroComplete() {
    return sharedPreferences.getBool(Constants.intro_done_key) ?? false;
  }


  @override
  bool isLogin() {
    return sharedPreferences.getBool(Constants.login) ?? false;
  }

  @override
  login(bool value) {
    sharedPreferences.setBool(Constants.login, value);
  }

  @override
  String numberCode() {
    return sharedPreferences.getString(Constants.countrycode) ?? "";
  }

  @override
  saveNumberCode(String code) {
    sharedPreferences.setString(Constants.countrycode, code);
  }

  @override
  saveUserId(String id) {
   sharedPreferences.setString(Constants.userId, id);
  }

  @override
  void saveSliderDone(bool done) {
    sharedPreferences.setBool(Constants.intro_done_key, done);
  }

  @override
  bool sliderDone() {
    return sharedPreferences.getBool(Constants.intro_done_key) ?? false;
  }


  @override
  String accountStatus() {
    return sharedPreferences.getString(Constants.accountStatus) ?? "";
  }

  @override
  setAccountStatus(String status) {
    sharedPreferences.setString(Constants.accountStatus, status);
  }



  // @override
  // String get code =>  sharedPreferences.getString(Constants.countrycode) ?? "";

}