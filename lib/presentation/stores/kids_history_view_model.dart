import 'package:mobx/mobx.dart';

import '../../core/common/alert_action.dart';
import '../../core/common/app_settings.dart';
import '../../core/common/data_state.dart';
import '../../core/common/message_informer.dart';
import '../../core/common/response.dart';
import '../../core/domain/response/kid_short_info_response.dart';
import '../../core/helpers/navigation_service.dart';
import '../../core/helpers/string_provider.dart';
import '../../core/repository/kidshistory_repository.dart';
import '../../utils/dialog_manager.dart';
import '../app_navigator/di.dart';


part 'kids_history_view_model.g.dart';

class KidsHistoryViewModel = _KidsHistoryViewModel with _$KidsHistoryViewModel;



abstract class _KidsHistoryViewModel with Store{
  final _navigator = instance<NavigationService>();
  final _kidUseCase = instance<KidsHistoryRepository>();
  final _appSettings = instance<AppSettings>();
  final dialogManager = DialogManager();
  final msgInformer = MessageInformer();

  @observable
  List<ShortDetails> kidHistory = [];

  @observable
  bool isLoading = false;


  @observable
  String kidName = StringProvider.userName;

  @observable
  String kidClass = "";

  String kidAge = "";

  @observable
  String Rmessage = '';

  @observable
  String image = "";




  _KidsHistoryViewModel() {
    getInitialData();
  }



  getInitialData() async{
    isLoading = true;
    // var userId = _appSettings.userId;
    var userId = "1";
    var deviceId = "1423";
    var response = await _kidUseCase.kidsHistoryInfo(userId, deviceId);
    if (response is Success) {
      var data = response.data;
      isLoading = false;
      switch (data != null && data.status) {
        case true:
          if (data!.shortDetails.isEmpty) {
            Rmessage = data.message;
            kidHistory = [];
          } else {
            kidHistory = data.shortDetails;

          }
      }
    }

  }


  onError(AlertAction? action) {
    if (action == AlertAction.kidShortInfo) {
      getInitialData();
    }
  }

}