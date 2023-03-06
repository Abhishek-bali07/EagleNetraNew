abstract class AppSettings{
  saveUserId(String userId);
  get userId;

  String get baseUrl;
  setBaseUrl(String baseUrl);


  // introComplete(bool value);
  // bool isIntroComplete();

  void setUserId(String userId);


  void saveSliderDone(bool done);
  bool sliderDone();


  login(bool value);
  bool isLogin();


  setAccountStatus(String status);
  String accountStatus();

  //void setUserId(String userId);

  //String userId();
}