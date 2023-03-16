import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/alert_action.dart';
import '../../core/common/app_settings.dart';
import '../../core/common/message_informer.dart';
import '../../core/common/response.dart';
import '../../core/domain/response/kid_details_response.dart';
import '../../core/domain/response/kid_short_info_response.dart';
import '../../core/domain/response/subscription_info_response.dart';
import '../../core/helpers/navigation_service.dart';
import '../../core/helpers/string_provider.dart';
import '../../core/repository/subscription_repository.dart';
import '../../helpers_impl/date_time_helper.dart';
import '../../utils/dialog_manager.dart';
import '../app_navigator/di.dart';
import '../app_navigator/routes.dart';

part 'subscription_page_view_model.g.dart';

class SubscriptionPageViewModel = _SubscriptionPageViewModel with _$SubscriptionPageViewModel;


abstract class _SubscriptionPageViewModel with Store{
  final _navigator = instance<NavigationService>();
  final _subscriptionUseCase = instance<SubscriptionRepository>();
  final _appSettings = instance<AppSettings>();
  final dialogManager = DialogManager();
  final msgInformer = MessageInformer();
  final _dateTimeHelper = DateTimeHelper();

  ShortDetail? data;

  @observable
  List<ShortDetail> subscrptionHistory = [];

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

  @observable
  String amount = "";

  @observable
  String expireDate = "";


  @action
  onSelectedDate(DateTime? selected) {
    if (selected != null) {
      return "${selected.day}-${selected.month}-${selected.year}";
    } else {
      return StringProvider.expiryDate;
    }
  }


  _SubscriptionPageViewModel(this.data) {
    getInitialData();
  }

  @action
  getInitialData() async {
    isLoading = true;
    // var smartCardId = "1";
    var smartCardId = data!.smartCardId;
    var response = await _subscriptionUseCase.subscriptionInfo(smartCardId);
    if(response is Success){
      var data = response.data;
      isLoading = false;
      switch(data != null && data.status){
        case true:
          if(data!.shortDetails.isEmpty){
            Rmessage = data.message;
            subscrptionHistory = [];
          }else{
            subscrptionHistory = data.shortDetails;
            debugPrint("$subscrptionHistory");
          }
      }
    } else if(response is Error){
      msgInformer.informUi(response.message ?? "");
    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.kidShortInfo) {
      getInitialData();
    }
  }


  Future<bool> backToPrevious() async{
    // _navigator.popAndNavigateTo(Routes.safearea);
    //_navigator.pop();
    _navigator.navigatorKey.currentState!.popUntil((route) => route.isFirst );
    return false;
  }


}