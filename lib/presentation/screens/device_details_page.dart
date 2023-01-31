import 'package:eagle_netra/core/helpers/image_assets.dart';
import 'package:eagle_netra/presentation/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../stores/dashboard_page_view_model.dart';

class DeviceDetailsPage extends StatefulWidget {
  const DeviceDetailsPage({Key? key, required this.parentViewModel})
      : super(key: key);
   final DashBoardPageViewModel parentViewModel;


  @override
  State<DeviceDetailsPage> createState() => _DeviceDetailsPageState();
}

class _DeviceDetailsPageState extends State<DeviceDetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.White,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: CircleAvatar()),
                    SizedBox(width: 0.02.sw),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.parentViewModel.kidName,style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text(widget.parentViewModel.currentDate),
                        ],
                      ),
                    ),
                    SizedBox(width: 0.01.sw),
                    Expanded(
                    child:GestureDetector(
                     onTap: () async{
                       Uri phoneno = Uri.parse("tel:${widget.parentViewModel.callingNumber}");
                    if (await launchUrl(phoneno)) {
                       launchUrl(phoneno);
                       }
                     } ,
                     child: SvgPicture.asset(ImageAssets.telephone)),
                ),


                  ],
                ),

                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(ImageAssets.battery),
                            Text("${widget.parentViewModel.battery}Battery")
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(widget.parentViewModel.deviceCondition),
                            SvgPicture.asset(ImageAssets.network),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                const Center(
                    child: Text(
                  "Current Location",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child:  Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                          widget.parentViewModel.locationAddress,textAlign: TextAlign.center,),
                      ),
                    ),
                    SizedBox(width: 0.02.sw),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          iconSize: 60.sp,
                          onPressed: () {},
                          icon: SvgPicture.asset(ImageAssets.navigate)),
                    ),

                  ],
                )
              ],
            ),
        ),

      ),
    );
  }
}
