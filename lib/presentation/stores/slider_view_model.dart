import 'package:eagle_netra/core/domain/intro_data.dart';
import 'package:mobx/mobx.dart';

part 'slider_view_model.g.dart';

class SliderStore = _SliderScreenStore with _$SliderStore;

abstract class _SliderScreenStore with Store{
 //List<IntroData> data;
 //_SliderScreenStore({required this.data});

  @observable
  int currentPage = 0;

  @action
  onChange(int page) {
    currentPage = page;
  }

  @action
  onNext() {}
}