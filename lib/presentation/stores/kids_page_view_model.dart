import 'package:mobx/mobx.dart';
import '../../core/common/alert_action.dart';
import '../../core/common/app_settings.dart';
import '../../core/common/data_state.dart';

import '../../core/common/response.dart';
import '../../core/domain/response/kid_short_info_response.dart';
import '../../core/helpers/navigation_service.dart';
import '../../core/helpers/string_provider.dart';
import '../../core/repository/kid_repository.dart';
import '../../utils/dialog_manager.dart';
import '../app_navigator/di.dart';

part 'kids_page_view_model.g.dart';

class KidsPageViewModel = _KidsPageViewModel with _$KidsPageViewModel;


abstract class _KidsPageViewModel with Store{
  final _navigator = instance<NavigationService>();
  final _kidUseCase = instance<KidAccountRepository>();
  final _appSettings = instance<AppSettings>();
  final dialogManager = DialogManager();

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

  @observable
  DataState loading = DataState.NORMAL;


  _KidsPageViewModel() {
    getInitialData();
  }

  getInitialData() async {
   isLoading = true;
   var userId = _appSettings.userId();
    var response = await _kidUseCase.kidShortInfo(userId);
    if (response is Success) {
      var data = response.data;
      isLoading =  false;
      switch (data != null && data.status) {
        case true:
          if(data!.shortDetails.isEmpty)
            Rmessage = data.message;
            kidHistory = [];
          // loading = DataState.SUCCESS;
          // kidName = data!.shortDetails.name;
          // kidAge = data.shortDetails.age;
          // kidClass = data.shortDetails.clsname;
          // image = data.shortDetails.image;

          break;
        default:
          loading = DataState.FAILED;

      }
    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.kidShortInfo) {
      getInitialData();
    }
  }


}