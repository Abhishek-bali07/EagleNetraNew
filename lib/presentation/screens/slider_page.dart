import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eagle_netra/presentation/stores/main_view_model.dart';
import 'package:eagle_netra/presentation/stores/slider_view_model.dart';
import 'package:eagle_netra/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/constants.dart';
import '../../core/domain/intro_data.dart';
import '../../core/helpers/slider_data.dart';
import '../ui/theme.dart';

SliderStore vm = SliderStore();


class SliderPage extends StatefulWidget {

  SliderPage({Key? key, }) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FractionallySizedBox(
        heightFactor: 1,
        child: intro(),
      ),
    );
  }
  intro(){
    return Stack(
      children: [
        CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(
              onPageChanged: (page,_){
                vm.onPageChange(page);
              },
              enableInfiniteScroll: false,
              onScrolled: (scrolled){

              },
              height: MediaQuery.of(context).size.height,
              viewportFraction: 1
          ),
          items: [0,1,2].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SliderData.sliderData[i].image),
                        SizedBox(
                          //height: 50,
                          //height: 12,
                            height: getGapInImageAndTitle()
                        ),
                        Text(
                          SliderData.sliderData[i].title,
                          style: TextStyle(
                            fontSize: 35,
                            color: AppColors.Black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          SliderData.sliderData[i].message,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Observer(
            builder: (_) => skipableAndIndicator()
        ),
      ],
    );
  }

  skipableAndIndicator(){
    if(vm.isLastPage){
      return Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: getButtonBottomPadding(),
                  left: 24,
                  right: 24
              ),
              child: Container(
                height: 60,
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.drawerPrimary, // background
                    // onPrimary: Colors.yellow, // foreground
                  ),
                  onPressed: (){
                    vm.onGetStarted();
                  },
                  child: Text(
                    Constants.getStarted,
                    style: TextStyle(
                        color: AppColors.Black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }
    else{
      return Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: getIndicatorBottomPadding()
              ),
              child: Container(
                height: 34,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Observer(
                        builder: (_) => GestureDetector(
                          onTap: (){
                            buttonCarouselController.animateToPage(index);
                            vm.onPageChange(index);
                          },
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                                color: vm.currentPage==index ? Theme.of(context).primaryColor : AppColors.Alto,
                                shape: BoxShape.circle
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                //bottom: 178
                  bottom: getSkipBottomPadding()
              ),
              child: TextButton(
                onPressed: (){
                  buttonCarouselController.jumpToPage(3);
                },
                child: Text(
                  Constants.skip,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.Black,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }
  }

  getGapInImageAndTitle() {
    var m = MediaQuery.of(context);
    var dpr = m.devicePixelRatio;
    var w = m.size.width*dpr;
    if(w<=768){
      return 12.0;
    }
    else if(w<=1080){
      return 50.0;
    }
    else{
      return 50.0;
    }
  }

  getButtonBottomPadding() {
    var m = MediaQuery.of(context);
    var dpr = m.devicePixelRatio;
    var w = m.size.width*dpr;
    if(w<=768){
      return 20.0;
    }
    else if(w<=1080){
      return 60.0;
    }
    else{
      return 60.0;
    }
  }

  getIndicatorBottomPadding() {
    var m = MediaQuery.of(context);
    var dpr = m.devicePixelRatio;
    var w = m.size.width*dpr;
    if(w<=768){
      return 20.0;
    }
    else if(w<=1080){
      return 96.0;
    }
    else{
      return 96.0;
    }
  }

  getSkipBottomPadding() {
    var m = MediaQuery.of(context);
    var dpr = m.devicePixelRatio;
    var w = m.size.width*dpr;
    if(w<=768){
      return 55.0;
    }
    else if(w<=1080){
      return 178.0;
    }
    else{
      return 178.0;
    }
  }



  }




