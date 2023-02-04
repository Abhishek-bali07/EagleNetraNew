import 'dart:developer';

import 'package:flutter/material.dart';
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
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();

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
        Expanded(
            flex: 1,
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
                      Expanded(flex: 2, child: Padding(
                        padding: const EdgeInsets.only(left:8.0,top: 5.0),
                        child: Text("Date:"),
                      )),
                      Expanded(
                        flex: 7,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Observer(builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.only(left:8.0,top: 5.0),
                                  child: Text(_viewm.date,
                                      style: TextStyle(
                                          color: AppColors.Black,
                                          fontSize: 16.sp)),
                                );
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

        Expanded(
          flex: 1,
          child: Observer(
            builder: (BuildContext context) {
              return Visibility(
                visible: _viewm.date.isNotEmpty ? true : false,
                replacement: SizedBox.shrink(),
                child:Container(
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex:2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "StartTime: ${_viewm.startTime}",
                            ),
                          ),
                        ),
                        SizedBox(width: 0.05.sw),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "EndTime: ${_viewm.endTime}",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              TimeRangePicker.show(
                                context: context,
                                unSelectedEmpty: true,
                                startTime: TimeOfDay(
                                    hour: _startTime.hour, minute: _startTime.minute),
                                endTime: TimeOfDay(
                                    hour: _endTime.hour, minute: _endTime.minute),
                                onSubmitted: (TimeRangeValue value) {
                                  setState(() {
                                    if(value.startTime != null) {
                                      _viewm.rangeStart(context, value.startTime!);
                                    }
                                    if(value.endTime != null) {
                                      _viewm.rangeEnd(context, value.endTime!);
                                    }
                                    /*_startTime = value.startTime!;
                                            _endTime = value.endTime!;*/
                                  });
                                },
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Icon(
                                Icons.timer,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          flex: 8,
          child: Observer(builder: (BuildContext context) {
            return GoogleMap(
              initialCameraPosition: _viewm.initialCameraPosition(),
              zoomControlsEnabled: true,
              scrollGesturesEnabled: true,
              indoorViewEnabled: true,
              onMapCreated: onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers:_viewm.markers,
            );
          }),
        ),
        Expanded(
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
      ],
    );
  }
}
