import 'package:eagle_netra/presentation/app_navigator/routes.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/alert_action.dart';
import '../../core/common/app_settings.dart';
import '../../core/common/message_informer.dart';
import '../../core/common/response.dart';

import '../../core/domain/response/kid_details_response.dart';
import '../../core/domain/response/kid_short_info_response.dart';
import '../../core/domain/response/safe_area_response.dart';
import '../../core/helpers/details_safearea_response.dart';
import '../../core/helpers/navigation_service.dart';
import '../../core/helpers/string_provider.dart';
import '../../core/repository/safearea_repository.dart';
import '../../utils/dialog_manager.dart';
import '../app_navigator/di.dart';

part 'safearea_page_view_model.g.dart';

class SafeAreaPageViewModel = _SafeAreaPageViewModel
    with _$SafeAreaPageViewModel;


abstract class _SafeAreaPageViewModel with Store {
  final _navigator = instance<NavigationService>();
  final _safeareaUseCase = instance<SafeAreaRepository>();
  final _appSettings = instance<AppSettings>();
  final dialogManager = DialogManager();
  final msgInformer = MessageInformer();

  ShortDetail data;

  //AreaDetails? safearea;

  @observable
  @observable
  bool isLoading = false;


  @observable
  bool dataLoader = false;


  @observable
  List<AreaDetails> safeAreaList = [];


  @observable
  String kidName = StringProvider.userName;

  @observable
  String kidClass = "";

  String kidAge = "";

  @observable
  String Rmessage = '';

  @observable
  String image = "";


  _SafeAreaPageViewModel(this.data) {
    initialData();
  }


  initialData() async {
    isLoading = true;
    var userId = _appSettings.userId;
    var smartCardId = data.smartCardId;
    var response = await _safeareaUseCase.kidShortInfo(userId, smartCardId);
    if (response is Success) {
      var data = response.data;
      isLoading = false;
      switch (data != null && data.status) {
        case true:
          if (data!.areaDetails?.isEmpty == true) {
            safeAreaList = [];
          } else {
            if (data.areaDetails != null) {
              safeAreaList = data.areaDetails;
            }
          }
      }
    } else if (response is Error) {
      msgInformer.informUi(response.message ?? "");
    }
  }


  switcherData(AreaDetails safeArea, {Function(bool)? changedState}) async {
    dataLoader = true;
    var safeAreaId = safeArea.safeAreaId;
    bool state = safeArea.state;
    var response = await _safeareaUseCase.AddSafearea(safeAreaId, state);
    if (response is Success) {
      var data = response.data;
      dataLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data != null) {
            changedState?.call(data.isActivated);
          }
      }
    }
    else if (response is Error) {

    }
  }


  onError(AlertAction? action) {
    if (action == AlertAction.kidShortInfo) {
      initialData();
    }
  }


  onAddSafeareaSection(ShortDetail arg) {
    _navigator.navigateTo(Routes.addsafearea, arguments: arg);
  }

  onEditSafeareaSection(AreaDetails? arg) {
    if (arg != null) {
      _navigator.navigateTo(
          Routes.addsafearea, arguments: DetailSafeArea(data: data, safearea: arg));
    }
  }


  Future<bool> backToPrevious() async {
    // _navigator.popAndNavigateTo(Routes.safearea);
    //_navigator.pop();
    _navigator.navigatorKey.currentState!.popUntil((route) => route.isFirst);
    return false;
  }
}


// backToPrevious(){
//   //_navigator.popAndNavigateTo(Routes.kidPage);
//   _navigator.pop();
// }