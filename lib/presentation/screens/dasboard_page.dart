import 'package:eagle_netra/helpers_impl/my_dialog_impl.dart';
import 'package:eagle_netra/presentation/app_navigator/routes.dart';
import 'package:eagle_netra/presentation/ui/theme.dart';
import 'package:eagle_netra/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/dialog_state.dart';
import '../../core/common/lat_long.dart';
import '../../core/domain/response/kid_short_info_response.dart';
import '../../core/helpers/image_assets.dart';
import '../../core/helpers/navigation_service.dart';
import '../../helpers_impl/error_dialog_impl.dart';
import '../../utils/dialog_controller.dart';
import '../app_navigator/di.dart';
import '../stores/dashboard_page_view_model.dart';
import 'device_details_page.dart';

class DashboardPage extends StatefulWidget {
  // ShortDetails arguments;
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with WidgetsBindingObserver {
  late final ScrollController _scontroller;
  GoogleMapController? _controller;
  late final DashBoardPageViewModel _viewm;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;

  onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  void initState() {
    _dialogController =
        DialogController(dialog: MyDialogImpl(buildContext: context));
    _viewm = DashBoardPageViewModel();
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _disposers = [
      reaction((p0) => _viewm.dialogManager.currentErrorState, (p0) {
        if (p0 == DialogState.displaying) {
          _dialogController.show(_viewm.dialogManager.errorData!, p0,
              close: _viewm.dialogManager.closeErrorDialog,
              positive: _viewm.onRetry);
        }
      }),
      reaction((p0) => _viewm.mainVM.dialogManager.currentState, (p0) {
        if (p0 == DialogState.displaying) {
          _dialogController.show(_viewm.mainVM.dialogManager.data!, p0,
              close: _viewm.dialogManager.closeDialog,
              positive: _viewm.mainVM.onAction);
        }
      }),
      reaction((p0) => _viewm.mainVM.currentLocation, (p0) {
        if (p0 != null) {
          _controller?.moveCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(p0.latitude, p0.longitude), zoom: 8),
          ));
        }
      }),
      reaction((p0) => _viewm.isShow, (p0) async {
        if (p0 == true) {
          await showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r))),
              builder: (context) => DeviceDetailsPage(parentViewModel: _viewm));
          _viewm.openBottomSheet();
        }
      }),
      reaction((p0) => _viewm.seletedR, (p0) {
        if (p0 != null) {
          _controller?.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(p0.latLong.lat, p0.latLong.lng), zoom: 16)));
        }
      })
      // reaction((p0) => _viewm.dialogManager.currentState, (p0) {
      //   if (p0 == DialogState.displaying) {
      //     _dialogController.show(
      //       _viewm.dialogManager.data!,
      //       p0,
      //       positive: _viewm.logout,
      //       negative: _viewm.closeLogoutDialog,
      //       close: _viewm.dialogManager.closeDialog,
      //     );
      //   }
      // }),
    ];
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint("$state");
    if (state == AppLifecycleState.resumed) {
      _viewm.mainVM.getCurrentLocation();
    }
  }

  @override
  void dispose() {
    for (var element in _disposers) {
      element();
    }
    WidgetsBinding.instance.removeObserver(this);
    _viewm.mainVM.locationStreamDisposer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appBlack,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              if (!Scaffold.of(context).isDrawerOpen) {
                Scaffold.of(context).openDrawer();
              }
            },
            icon: const Icon(
              Icons.menu,
              size: 40,
              color: AppColors.drawerPrimary,
            ),
          ),
        ),
        title: Container(
          width: 50,
          child: Image.asset(ImageAssets.logo),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 40,
              color: AppColors.drawerPrimary,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(children: [
          _lowerSideContent(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 8.0, left: 1.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Material(
                      color: Colors.grey[300],
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                size: 35.sp,
                                color: Colors.grey,
                              )),
                          Expanded(
                            child: TextField(
                              // textAlign: TextAlign.center,
                              decoration: const InputDecoration.collapsed(
                                hintText: 'Search by name',
                              ),
                              onChanged: _viewm.onSelectKid,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Observer(
                builder: (context) => _viewm.kCategories.isNotEmpty
                    ? ListView.builder(
                        //controller: _scontroller,
                        itemCount: _viewm.kCategories.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Container(
                                height: 0.06.sw,
                                width: 0.03.sw,
                                color: Colors.white70,
                                alignment: Alignment.center,
                                // decoration: const BoxDecoration(
                                //   color: Colors.grey,
                                //   borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                // ),
                                child: Text(_viewm.kCategories[index].name)),
                          ),
                          onTap: () {
                            _viewm.onItemClick(_viewm.kCategories[index]);
                          },
                        ),
                      )
                    : const SizedBox.shrink(),
              )
            ],
          )
        ]),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Observer(
                  builder: (context) => Text(
                        _viewm.userName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.sp),
                      )),
              accountEmail:
                  Observer(builder: (context) => Text(_viewm.userEmail)),
              decoration: const BoxDecoration(
                color: AppColors.drawerPrimary,
              ),
              currentAccountPicture: Observer(
                builder: (BuildContext context) {
                  return _viewm.userImage.isNotEmpty
                      ? CircleAvatar(
                          backgroundColor: AppColors.lightGray,
                          foregroundImage: NetworkImage(_viewm.userImage),
                        )
                      : CircleAvatar(
                          child: SvgPicture.asset("assets/images/lady.svg"),
                        );
                },
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                ImageAssets.dashboard,
                height: 25.sp,
              ),
              title: const Text("Dashboard "),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: SvgPicture.asset(ImageAssets.mykids, height: 25.sp),
              title: const Text("My Kids"),
              onTap: () {
                Navigator.popAndPushNamed(context, Routes.kidPage);
              },
            ),
            ListTile(
                leading: SvgPicture.asset(ImageAssets.safearea, height: 25.sp),
                title: const Text("Safe Area"),
                onTap: () =>
                    _viewm.onSafeareaSection(_viewm.detailHistory.first)),
            ListTile(
              leading: SvgPicture.asset(ImageAssets.sos, height: 25.sp),
              title: const Text("SOS Numbers"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: SvgPicture.asset(ImageAssets.contact, height: 25.sp),
              title: const Text("History"),
              onTap: () {
                Navigator.pushNamed(context, Routes.kidsHistory);
              },
            ),
            ListTile(
              leading: SvgPicture.asset(ImageAssets.access, height: 25.sp),
              title: const Text("Access"),
              onTap: () {
                Navigator.pushNamed(context, Routes.management);
              },
            ),
            ListTile(
                leading: SvgPicture.asset(ImageAssets.contact, height: 25.sp),
                title: const Text("Subscription"),
                onTap: () =>
                    _viewm.onSubscriptionSection(_viewm.detailHistory.first)),
            ListTile(
              leading: SvgPicture.asset(ImageAssets.support, height: 25.sp),
              title: const Text("Support "),
              onTap: () {
                Navigator.pushNamed(context, Routes.support);
              },
            ),
            ListTile(
                leading: SvgPicture.asset(ImageAssets.logout, height: 25.sp),
                title: const Text("Logout"),
                onTap: _viewm.isTap ? null : _viewm.onLogout),
          ],
        ),
      ),
    );
  }

  @override
  Widget _lowerSideContent() {
    return Align(
      child: Stack(
        children: [
          Observer(builder: (BuildContext context) {
            return GoogleMap(
              key: ValueKey(_viewm.isVisible),
              initialCameraPosition: _viewm.initialCameraPosition(),
              zoomControlsEnabled: true,
              scrollGesturesEnabled: true,
              indoorViewEnabled: true,
              onMapCreated: onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: _viewm.markers,
              // onLongPress: (latlng) {
              //   _viewm.setupMarker(
              //       LatLong(lat: latlng.latitude, lng: latlng.longitude));
              //   // _vm.setupCircle(LatLong(lat:latlng.latitude, lng:latlng.longitude));
              // },
            );
          }),
        ],
      ),
    );
  }
}
