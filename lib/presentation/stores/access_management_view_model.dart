import 'package:mobx/mobx.dart';
part 'access_management_view_model.g.dart';

class AccessManagementViewModel = _AccessManagementViewModel  with _$AccessManagementViewModel;



abstract class _AccessManagementViewModel with Store{

  var name = "";

  var mobile = "";

  var relation = "";

  @observable
  bool valid = false;

  @observable
  bool submitting = false;
}