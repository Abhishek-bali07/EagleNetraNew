import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/dialog_state.dart';
import '../../core/domain/response/kid_short_info_response.dart';
import '../../utils/app_date_picker.dart';
import '../../utils/dialog_controller.dart';
import '../stores/kids_track_page_view_model.dart';
import '../ui/theme.dart';

class KidsTrackPage extends StatefulWidget {
   ShortDetails arguments;
   KidsTrackPage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<KidsTrackPage> createState() => _KidsTrackPageState();
}

class _KidsTrackPageState extends State<KidsTrackPage> {

  GoogleMapController? _controller;
  late final KidsTrackPageViewModel _viewm;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;

  onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  void initState() {
    _viewm = KidsTrackPageViewModel(widget.arguments);
    super.initState();

    _disposers = [
      reaction((p0) => _viewm.dialogManager.currentErrorState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(_viewm.dialogManager.errorData!, p0,
              positive: _viewm.onError,
              close: _viewm.dialogManager.closeErrorDialog);
        }
      }),
      reaction((p0) =>_viewm.dialogManager.datePickerState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          AppDatePicker.show(context, DateTime.now(), DateTime(2000),
              DateTime(2050), _viewm.onSelectDate,
              dismissed: _viewm.dialogManager.closeDatePicker);
        }
      }),
      reaction((p0) => _viewm.mainVM.currentLocation, (p0) {
        if (p0 != null) {
          _controller?.moveCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(p0.latitude, p0.longitude), zoom: 15),
          ));
        }
      }),
    ];
  }


  @override
  void dispose() {
    for (var element in _disposers) {
      element();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appBlack,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text("Kid(s) History"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child:
            Observer(
                builder: (BuildContext context) {
                  return _viewm.image.isNotEmpty
                      ? CircleAvatar(
                    radius: 0.06.sw,
                    backgroundColor: AppColors.lightGray,
                    foregroundImage:
                    NetworkImage(_viewm.image),
                  )
                      : CircleAvatar(
                    radius: 0.06.sw,
                    // backgroundColor:
                    //     AppColors.drawerPrimary,
                      child: SvgPicture.asset(
                        "assets/images/boy.svg"),
                  );
                },
          )
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [

            Expanded(flex: 8, child: _lowerSideContent())
          ],
        ),

      ),
    );
  }




  Widget _lowerSideContent() {
    return Column(
      children: [
        Expanded(
          flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0.01.sw, right: 0.02.sw,left: 0.02.sw),
                  child: InkWell(
                    onTap: _viewm.openDatePicker,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: AppColors.White),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x1a000000),
                                blurRadius: 20,
                                spreadRadius: 0,
                                offset: Offset(0, 0))
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.05.sw, horizontal: 0.05.sw),
                        child: Row(
                          children: [
                            Expanded(child: Text("Date")),
                            Expanded(
                              flex: 8,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Observer(builder: (BuildContext context) {
                                      return Text(_viewm.date,
                                          style: TextStyle(
                                              color: AppColors.Black,
                                              fontSize: 16.sp));
                                    })
                                    /**/
                                  ],
                                ),
                              ),
                            ),
                            const Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.date_range,
                                  color: Colors.black38,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        Expanded(
          flex:9,
          child: Observer( builder: (BuildContext context) {
            return GoogleMap(
              initialCameraPosition: _viewm.initialCameraPosition(),
              zoomControlsEnabled: true,
              scrollGesturesEnabled: true,
              indoorViewEnabled: true,
              onMapCreated: onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              //markers:_viewm.markers,
              // onLongPress: (latlng) {
              //   _viewm.setupMarker(
              //       LatLong(lat: latlng.latitude, lng: latlng.longitude));
              //   // _vm.setupCircle(LatLong(lat:latlng.latitude, lng:latlng.longitude));
              // },
            );
          }
          ),
        ),
      ],
    );
  }



}
