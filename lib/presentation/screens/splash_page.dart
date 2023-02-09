import 'package:eagle_netra/core/helpers/image_assets.dart';
import 'package:eagle_netra/core/helpers/string_provider.dart';
import 'package:eagle_netra/presentation/stores/splashpage_view_model.dart';
import 'package:eagle_netra/presentation/ui/lottie_asset.dart';
import 'package:eagle_netra/utils/connectivity_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
 late final  SplashViewModel viewm;

 @override
 void initState() {
    viewm = SplashViewModel();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 6,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _appLogo(),
              )),
          Expanded(
            flex: 4,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      const Expanded(
                        flex: 7,
                        child: SizedBox.shrink(),
                      ),

                      Expanded(
                        flex: 5,
                        child:Observer(
                        builder: (BuildContext context){
                        return AnimatedCrossFade(
                        firstChild: Padding(
                          padding:EdgeInsets.only(bottom: 0.02.sw),
                         child: Lottie.asset(LottieAsset.splashLoader)),
                          secondChild: Padding(padding:EdgeInsets.only(bottom: 0.02.sw),
                            child: Lottie.asset(LottieAsset.noInternet)),
                        crossFadeState: viewm.connectivityState ==
                            ConnectivityState.Gone
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 400));
                          },
                         ),
                       ),
                     ],
                    ),
                  ),
                 Expanded(
                   flex: 1,
                              child: FittedBox(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 0.05.sw),
                                  child: Observer(
                                    builder: (BuildContext context){
                                      return viewm.connectivityState ==
                                          ConnectivityState.Gone
                                          ? const Text(StringProvider.noInternet)
                                          : Text(
                                          "${StringProvider.appVersion}: ${viewm.packageInfo.version}");
                                    },
                                  ),
                                ),
                              ),
                             )
                     ]),
                ),
                ),
          ],
      ),
    );
}



  Widget _appLogo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 0.03.sw),
            child: Image.asset(ImageAssets.logo)),
        Padding(
          padding: EdgeInsets.only(bottom: 0.03.sw),
          child: Image.asset(ImageAssets.logotext),
        )
      ],
    );
  }



}


