abstract class AppSettings{
  saveUserId(String userId);
  get userId;

  String get baseUrl;
  setBaseUrl(String baseUrl);


  introComplete(bool value);
  bool isIntroComplete();



  void saveSliderDone(bool done);
  bool sliderDone();

  //void setUserId(String userId);

  //String userId();
}