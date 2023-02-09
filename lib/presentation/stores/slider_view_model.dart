import 'package:eagle_netra/core/domain/intro_data.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/app_settings.dart';
import '../../core/helpers/navigation_service.dart';
import '../app_navigator/di.dart';
import '../app_navigator/routes.dart';

part 'slider_view_model.g.dart';

class SliderStore = _SliderScreenStore with _$SliderStore;

abstract class _SliderScreenStore with Store{
var _appSettings = instance<AppSettings>();
var _navigator = instance<NavigationService>();



      @observable
      bool isLastPage = false;

      @observable
      int currentPage = 0;

      @action
      onPageChange(int page){
        if(currentPage==page){
          return;
        }
        currentPage = page;
        if(currentPage==2){
          isLastPage = true;
        }
        else{
          if(isLastPage){
            isLastPage = false;
          }
        }
      }

      @action
      skip(){
        onPageChange(3);
      }

      @action
      onGetStarted(){
        saveIntroDone();
        _navigator.navigatorKey.currentState?.popAndPushNamed(Routes.mobileinput);
      }

      void saveIntroDone() {
        _appSettings.saveSliderDone(true);
      }
}