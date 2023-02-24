import 'dart:developer';

import 'package:eagle_netra/core/helpers/image_assets.dart';
import 'package:eagle_netra/presentation/ui/app_text_style.dart';
import 'package:eagle_netra/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:timelines/timelines.dart';

import '../../core/common/dialog_state.dart';
import '../../core/domain/response/kid_short_info_response.dart';
import '../../utils/app_date_picker.dart';

import '../../utils/dialog_controller.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';
import '../stores/kids_track_page_view_model.dart';
import '../ui/theme.dart';

const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);
const todoColor = Color(0xffd1d2d7);

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
  int index = 0;

  int _processIndex = 3;

  Color getColor(int index) {
    if (index == _processIndex) {
      return completeColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return completeColor;
    }
  }

  onMapCreated(GoogleMapController controller) {
    _controller = controller;
     _viewm.initialData();
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
      reaction((p0) => _viewm.dialogManager.datePickerState, (p0) {
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
      // reaction((p0) => [_viewm.startTime, _viewm.endTime, _viewm.date], (p0) {
      //   if (p0.first.isNotEmpty && p0[1].isNotEmpty && p0[2].isNotEmpty) {
      //        _viewm.initialData();
      //   }
      // })
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
              child: Observer(
                builder: (BuildContext context) {
                  return _viewm.image.isNotEmpty
                      ? CircleAvatar(
                          radius: 0.06.sw,
                          backgroundColor: AppColors.lightGray,
                          foregroundImage: NetworkImage(_viewm.image),
                        )
                      : CircleAvatar(
                          radius: 0.06.sw,
                          // backgroundColor:
                          //     AppColors.drawerPrimary,
                          child: SvgPicture.asset("assets/images/boy.svg"),
                        );
                },
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [Expanded(flex: 10, child: _lowerSideContent())],
        ),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Column(
      children: [
        Material(
          child: InkWell(
            onTap: _viewm.openDatePicker,
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.05.sw),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: AppColors.White),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x1a000000),
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: Offset(0, 0))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Date:",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18.sp),
                    ),
                  ).padding(insets: EdgeInsets.only(right: 0.03.sw)),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Observer(
                          builder: (BuildContext context) => Text(_viewm.date,
                              style: TextStyle(
                                  color: AppColors.Black, fontSize: 18.sp))),
                    ),
                  ),
                  SvgPicture.asset(ImageAssets.calendar),
                ],
              ),
            ),
          ),
        ),
        const Divider(
          height: 1,
        ),
        Observer(
          builder: (BuildContext context) {
            return AnimatedCrossFade(
              crossFadeState: _viewm.date.isNotEmpty
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 400),
              firstChild: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.05.sw, vertical: 0.02.sw),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: AppColors.White),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0x1a000000),
                          blurRadius: 20,
                          spreadRadius: 0,
                          offset: Offset(0, 0))
                    ]),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Text(
                              "Form:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18.sp),
                            ).padding(insets: EdgeInsets.only(right: 0.03.sw)),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                _viewm.startTime,
                              ),
                            ),
                            SizedBox(width: 0.03.sw),
                            Text(
                              "To:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18.sp),
                            ).padding(insets: EdgeInsets.only(right: 0.03.sw)),
                            Text(
                              _viewm.endTime,
                            ),
                            GestureDetector(
                              onTap: () {
                                TimeRangePicker.show(
                                  context: context,
                                  unSelectedEmpty: true,
                                  startTime: _viewm.sTimeDisplay,
                                  endTime: _viewm.eTimeDisplay,
                                  autoAdjust: false,
                                  onStartTimeChange: (time) {
                                    _viewm.rangeStart(
                                        context, time);
                                  },
                                  onEndTimeChange: (time) {
                                    _viewm.rangeEnd(
                                        context, time);
                                  },
                                  onSubmitted: (TimeRangeValue value) {  },
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.timer,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                          ],
                        )),
                    Observer(
                      builder: (BuildContext context) {
                        return ElevatedButton(
                            onPressed: _viewm.enableBtn
                                ? () {
                                    _viewm.initialData();
                                  }
                                : null,
                            child: _viewm.isVisible
                                ? const CircularProgressIndicator(
                                    color: Colors.red,
                                  )
                                : Text("Submit"));
                      },
                    ),
                  ],
                ),
              ),
              secondChild: const SizedBox.shrink(),
              alignment: Alignment.center,
            );
          },
        ),
        Expanded(
          flex: 7,
          child: Observer(builder: (BuildContext context) {
            return GoogleMap(
              initialCameraPosition: _viewm.initialCameraPosition(),
              zoomControlsEnabled: true,
              scrollGesturesEnabled: true,
              indoorViewEnabled: true,
              onMapCreated: onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: _viewm.markers,
            );
          }),
        ),
        Visibility(
          visible: _viewm.enableBtn ? true : false,
          replacement: SizedBox.shrink(),
          child: Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Observer(
                  builder: (context) => Timeline.tileBuilder(
                    theme: TimelineThemeData(
                      direction: Axis.horizontal,
                      connectorTheme: const ConnectorThemeData(
                        space: 15.0,
                        thickness: 3.0,
                      ),
                    ),
                    builder: TimelineTileBuilder.connected(
                      connectionDirection: ConnectionDirection.before,
                      itemExtentBuilder: (_, __) =>
                          MediaQuery.of(context).size.width /
                          _viewm.process.length,
                      contentsBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            _viewm.process[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: getColor(index),
                            ),
                          ),
                        );
                      },
                      indicatorBuilder: (_, index) {
                        var color;
                        var child;
                        if (index <= _processIndex) {
                          color = completeColor;
                          child = const Icon(
                            Icons.timer,
                            color: Colors.white,
                            size: 15.0,
                          );
                        } else {
                          color = completeColor;
                          child = const Icon(
                            Icons.timer,
                            color: Colors.white,
                            size: 15.0,
                          );
                        }

                        if (index <= _processIndex) {
                          return Stack(
                            children: [
                              CustomPaint(
                                size: Size(20.0, 20.0),
                              ),
                              DotIndicator(
                                size: 20.0,
                                color: color,
                                child: child,
                              ),
                            ],
                          );
                        } else {
                          return Stack(
                            children: [
                              CustomPaint(
                                size: Size(20.0, 20.0),
                              ),
                              DotIndicator(
                                size: 20.0,
                                color: color,
                                child: child,
                              ),
                            ],
                          );
                        }
                      },
                      connectorBuilder: (_, index, type) {
                        if (index > 0) {
                          if (index == _processIndex) {
                            final prevColor = getColor(index - 1);
                            final color = getColor(index);
                            List<Color> gradientColors;
                            if (type == ConnectorType.start) {
                              gradientColors = [
                                Color.lerp(prevColor, color, 0.5)!,
                                color
                              ];
                            } else {
                              gradientColors = [
                                prevColor,
                                Color.lerp(prevColor, color, 0.5)!
                              ];
                            }
                            return DecoratedLineConnector(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: gradientColors,
                                ),
                              ),
                            );
                          } else {
                            return SolidLineConnector(
                              color: getColor(index),
                            );
                          }
                        } else {
                          return null;
                        }
                      },
                      itemCount: _viewm.process.length,
                    ),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
