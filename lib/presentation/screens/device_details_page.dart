import 'package:eagle_netra/core/helpers/image_assets.dart';
import 'package:eagle_netra/presentation/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeviceDetailsPage extends StatefulWidget {
  const DeviceDetailsPage({Key? key}) : super(key: key);

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
                          Text("Reyansh Saha",style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text("15:44 pm (14th December 2022)"),
                        ],
                      ),
                    ),
                    SizedBox(width: 0.01.sw),
                    Expanded(
                      child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(ImageAssets.telephone)),
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
                            Text("45% Battery")
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Good"),
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
                          "243, Grand Trunk Rd, N, Liluah, Howrah, West Bengal 711204",textAlign: TextAlign.center,),
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
