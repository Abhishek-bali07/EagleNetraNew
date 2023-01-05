import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eagle_netra/presentation/stores/main_view_model.dart';
import 'package:eagle_netra/presentation/stores/slider_view_model.dart';
import 'package:eagle_netra/utils/extensions.dart';
import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  const SliderPage({Key? key,}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  //MainViewModel mainvm;
  late final SliderStore _sliderStore;
  late final CarouselController  _carouselController;
  //_SliderPageState({required this.mainvm});


  @override
  void initState() {
    _carouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: null,
            carouselController: _carouselController,
            itemBuilder: (context, idx, rIdx){
              return idx.getIntroPage();
            },
            options: CarouselOptions(
              enableInfiniteScroll: false,
              onPageChanged: (page, reason){
                _sliderStore.onChange(page);
              },
              viewportFraction: 1,
              reverse: true,
              height: double.infinity,

            ),
          )
        ],
      ),
    );
  }
}
