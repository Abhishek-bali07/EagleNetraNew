import 'package:mobx/mobx.dart';

import '../../core/common/alert_action.dart';
import '../../core/common/app_settings.dart';
import '../../core/common/message_informer.dart';
import '../../core/common/response.dart';
import '../../core/domain/response/kid_short_info_response.dart';
import '../../core/helpers/navigation_service.dart';
import '../../core/helpers/string_provider.dart';
import '../../core/repository/safearea_repository.dart';
import '../../utils/dialog_manager.dart';
import '../app_navigator/di.dart';

part 'safearea_page_view_model.g.dart';

class SafeAreaPageViewModel = _SafeAreaPageViewModel with _$SafeAreaPageViewModel;


abstract class _SafeAreaPageViewModel with Store{
  final _navigator = instance<NavigationService>();
  final _safeareaUseCase = instance<SafeAreaRepository>();
  final _appSettings = instance<AppSettings>();
  final dialogManager = DialogManager();
  final msgInformer = MessageInformer();

  @observable
  bool isLoading = false;


  @observable
  bool dataLoader = false;


  @observable
  List<ShortDetails> safeAreaList = [];


  @observable
  String kidName = StringProvider.userName;

  @observable
  String kidClass = "";

  String kidAge = "";

  @observable
  String Rmessage = '';

  @observable
  String image = "";


  _SafeAreaPageViewModel(){
    initialData();
  }



  initialData() async {
    isLoading = true;
    //var userId = _appSettings.userId();
    var userId = "1";
    var response = await _safeareaUseCase.kidShortInfo(userId);
    if (response is Success) {
      var data = response.data;
      isLoading = false;
      switch (data != null && data.status) {
        case true:
          if (data!.shortDetails.isEmpty) {

            safeAreaList = [];
          } else {
            safeAreaList = data.shortDetails;
          }
      }
    }else if (response is Error) {
      msgInformer.informUi(response.message ?? "");
    }
  }


  getSafeareaData() async {
    dataLoader = true;
    var userId = _appSettings.userId();
    //var userId = "1";
    var deviceId = "CFG444442";
    var currentState = " ";
    var response = await _safeareaUseCase.AddSafearea(userId, deviceId, currentState);
    if (response is Success) {
      var data = response.data;
      dataLoader = false;
      switch (data != null && data.status) {

      }

    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.kidShortInfo) {
     initialData();
    }
  }

}