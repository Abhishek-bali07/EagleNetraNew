import 'package:eagle_netra/core/helpers/image_assets.dart';
import 'package:eagle_netra/presentation/stores/slider_view_model.dart';
import 'package:eagle_netra/presentation/ui/app_text_style.dart';
import 'package:eagle_netra/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroTwo extends StatelessWidget {
 // SliderStore store;
  int pos;
  IntroTwo({Key? key, required this.pos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 6, child: _upperSideContent()),
        Expanded(flex: 4, child: _lowerSideContent())
      ],
    );
  }

  Widget _upperSideContent() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FittedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.10.sw, vertical: 0.05.sw),
          child: Image.asset("${Global.baseUrl}${ImageAssets.screentwo}"),
        ),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 0.03.sw),
                child: Text("Route Tracking",
                    style: AppTextStyle.introHeadingStyle)),
            Padding(
                padding: EdgeInsets.only(bottom: 0.03.sw),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                  style: AppTextStyle.enterNumberSubHeadingStyle,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ))
          ],
        ),
      ),
    );
  }
}
