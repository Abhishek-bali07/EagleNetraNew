import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helpers/image_assets.dart';
import '../stores/my_kids_view_model.dart';
import '../ui/theme.dart';


class MyKidsScreen extends StatefulWidget {
  const MyKidsScreen({Key? key}) : super(key: key);

  @override
  State<MyKidsScreen> createState() => _MyKidsScreenState();
}

class _MyKidsScreenState extends State<MyKidsScreen> {
  late final MyKidsViewModel vm;


  @override
  void initState() {
    vm = MyKidsViewModel();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
      return Scaffold(
      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appBlack,
        leading: IconButton(
          onPressed: () {  },
          icon: Icon(Icons.arrow_back),

        ),
        title: Text("My Kids"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(flex: 1, child: _upperSideContent()),
            Expanded(flex: 7, child: _lowerSideContent())
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.SilverChalice,
        foregroundColor: AppColors.Black,
        onPressed:vm.onAddkidSection,
        child: Icon(Icons.add),
      ),


    );




  }


  @override
  Widget _upperSideContent() {
    return Container(

    );
  }


  @override
  Widget _lowerSideContent() {
    return SafeArea(
      child: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(ImageAssets.kidsImage),
            ),
            Text("Add your childs smart card.", style: TextStyle(
              fontSize: 25.sp,

            ),)
          ],
        ),
      ),
    );


  }
}
