import 'package:eagle_netra/core/common/response.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/alert_action.dart';
import '../../core/common/app_settings.dart';
import '../../core/common/message_informer.dart';
import '../../core/domain/response/kid_short_info_response.dart';
import '../../core/domain/response/management_history_response.dart';
import '../../core/helpers/navigation_service.dart';
import '../../core/helpers/string_provider.dart';
import '../../core/repository/management_history_repository.dart';
import '../../utils/dialog_manager.dart';
import '../app_navigator/di.dart';
import '../app_navigator/routes.dart';

part 'management_page_view_model.g.dart';

class ManagementViewModel = _ManagementViewModel with _$ManagementViewModel;



abstract class _ManagementViewModel with Store{
  final _navigator = instance<NavigationService>();
  final _managementUseCase = instance<ManagementHistoryRepository>();
  final _appSettings = instance<AppSettings>();
  final dialogManager = DialogManager();
  final msgInformer = MessageInformer();

  @observable
  List<AccessDetails> managementHistory = [];

  @observable
  bool isLoading = false;

  @observable
  String guardianName = StringProvider.userName;

  @observable
  String relationName = "";

  @observable
  String image = "";

  @observable
  String Rmessage = '';


  _ManagementViewModel(){
    getInitialData();
  }

  getInitialData() async{
    isLoading = true;
    //var userId = _appSettings.userId();
    var userId = "1";
    var response = await _managementUseCase.ManagementHistoryInfo(userId);
    if (response is Success) {
      var data = response.data;
      isLoading = false;
      switch (data != null && data.status) {
        case true:
          if (data!.accessDetails.isEmpty) {
            Rmessage = data.message;
            managementHistory = [];
          } else {
            managementHistory = data.accessDetails;

          }
      }
    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.accessShortInfo) {
      getInitialData();
    }
  }

  onAddManagementSection() async{
    var arg = await _navigator.navigateTo(Routes.accessmanagement);
    if(arg is bool){
      if(arg){
        getInitialData();
      }
    }
  }

  backToPrevious(){
    _navigator.popAndNavigateTo(Routes.dashboard);
  }



}