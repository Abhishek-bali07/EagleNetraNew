import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../utils/dialog_controller.dart';
import '../stores/add_safe_area_view_model.dart';
import '../ui/theme.dart';

class AddSafeaAreaPage extends StatefulWidget {
  const AddSafeaAreaPage({Key? key}) : super(key: key);

  @override
  State<AddSafeaAreaPage> createState() => _AddSafeaAreaPageState();
}

class _AddSafeaAreaPageState extends State<AddSafeaAreaPage> {
  late final AddSafeAreaPageViewModel _vm;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;



  @override
  void initState() {
    _vm = AddSafeAreaPageViewModel();
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
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Add SafeArea"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              child:SvgPicture.asset(
                  "assets/images/boy.svg")
            ),
          )
        ],
      ),






      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Expanded(flex: 10, child: _lowerSideContent())],
        ),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
        child:Stack(
            children: [
              GoogleMap(
                onTap: (_){
                  _vm.onSelectLocation();
                },
                initialCameraPosition: _vm.initialCameraPosition(),

              ),
            ],
            )


    );
  }


}
