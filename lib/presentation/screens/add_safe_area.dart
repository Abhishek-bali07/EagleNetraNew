import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:eagle_netra/core/common/lat_long.dart';
import 'package:eagle_netra/core/domain/response/safe_area_response.dart';
import 'package:eagle_netra/presentation/screens/safearea_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/dialog_state.dart';
import '../../core/domain/response/kid_details_response.dart';
import '../../core/domain/response/kid_short_info_response.dart';
import '../../core/helpers/details_safearea_response.dart';
import '../../helpers_impl/error_dialog_impl.dart';
import '../../utils/dialog_controller.dart';
import '../stores/add_safe_area_view_model.dart';
import '../ui/theme.dart';

class AddSafeaAreaPage extends StatefulWidget {
  //DetailSafeArea arguments;
  Object arguments;
  AddSafeaAreaPage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<AddSafeaAreaPage> createState() => _AddSafeaAreaPageState();
}

class _AddSafeaAreaPageState extends State<AddSafeaAreaPage> {
  late final TextEditingController textEditingController;
  GoogleMapController? _controller;
  late final AddSafeAreaPageViewModel _vm;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;

  onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  void initState() {
    _dialogController = DialogController(dialog: ErrorDialogImpl(buildContext: context));
    if (widget.arguments is DetailSafeArea) {
      _vm = AddSafeAreaPageViewModel((widget.arguments as DetailSafeArea).data,
          (widget.arguments as DetailSafeArea).safearea);
    } else if (widget.arguments is ShortDetail) {
      _vm = AddSafeAreaPageViewModel(widget.arguments as ShortDetail, null);
    }
    super.initState();

    _disposers = [
      reaction((p0) => _vm.dialogManager.currentErrorState, (p0) {
        if (p0 == DialogState.displaying) {
          _dialogController.show(_vm.dialogManager.errorData!, p0,
              close: _vm.dialogManager.closeErrorDialog, positive: _vm.onRetry);
        }
      }),
      reaction((p0) => _vm.mainVM.currentLocation, (p0) {
        if (p0 != null) {
          _controller?.moveCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(p0.latitude, p0.longitude), zoom: 15),
          ));
        }
      }),
      reaction((p0) => _vm.isShow, (p0) async {
        if (p0 == true) {
          await showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r))),
            context: context,
            builder: (context) => SafeAreaDetailsPage(parentVM: _vm));
          _vm.onNext();
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
    return WillPopScope(
      onWillPop: _vm.backToPrevious,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.appBlack,
          leading: IconButton(
            onPressed: () {
              _vm.backToPrevious();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Add SafeArea"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Observer(
                builder: (BuildContext context) {
                  return _vm.data.image.isNotEmpty
                      ?  CircleAvatar(
                    radius: 0.07.sw,
                    foregroundImage: NetworkImage(_vm.data.image),
                  ): CircleAvatar(
                    radius: 0.06.sw,
                    child: SvgPicture.asset("assets/images/boy.svg"),
                  );
                },

              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Expanded(flex: 10, child: _lowerSideContent())],
          ),
        ),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
      child: Stack(
        children: [
          Observer(
            builder: (BuildContext context) {
              return GoogleMap(
                initialCameraPosition: _vm.initialCameraPosition(),
                zoomControlsEnabled: true,
                scrollGesturesEnabled: true,
                indoorViewEnabled: true,
                onMapCreated: onMapCreated,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: _vm.markers,
                circles: _vm.circles,
                onLongPress: (latlng) {
                  _vm.setupMarker(
                      LatLong(lat: latlng.latitude, lng: latlng.longitude));
                  // _vm.setupCircle(LatLong(lat:latlng.latitude, lng:latlng.longitude));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
