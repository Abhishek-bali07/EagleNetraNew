import 'package:mobx/mobx.dart';

import '../../core/common/alert_action.dart';
import '../../core/common/app_settings.dart';
import '../../core/common/message_informer.dart';
import '../../core/common/response.dart';
import '../../core/domain/response/subscription_info_response.dart';
import '../../core/helpers/navigation_service.dart';
import '../../core/helpers/string_provider.dart';
import '../../core/repository/subscription_repository.dart';
import '../../utils/dialog_manager.dart';
import '../app_navigator/di.dart';

part 'subscription_page_view_model.g.dart';

class SubscriptionPageViewModel = _SubscriptionPageViewModel with _$SubscriptionPageViewModel;


abstract class _SubscriptionPageViewModel with Store{
  final _navigator = instance<NavigationService>();
  final _subscriptionUseCase = instance<SubscriptionRepository>();
  final _appSettings = instance<AppSettings>();
  final dialogManager = DialogManager();
  final msgInformer = MessageInformer();


  @observable
  List<SubscriptionDetails> subscrptionHistory = [];

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

  _SubscriptionPageViewModel() {
    getInitialData();
  }

  @action
  getInitialData() async {
    isLoading = true;
    var userId = _appSettings.userId;
    var response = await _subscriptionUseCase.subscriptionInfo(userId);
    if(response is Success){
      var data = response.data;
      isLoading = false;
      switch(data != null && data.status){
        case true:
          if(data!.subscriptionDetails.isEmpty){
            Rmessage = data.message;
            subscrptionHistory = [];
          }else{
            subscrptionHistory = data.subscriptionDetails;
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

}