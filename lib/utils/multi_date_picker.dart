// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import '../core/helpers/string_provider.dart';
// import '../presentation/ui/theme.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//
//
// class MultiDatePicker {
//   MultiDatePicker ._();
//
//   static show(BuildContext context,DateTime minDate, DateTime maxDate,
//       DateTime initialDisplayDate, Function(DateRangePickerSelectionChangedArgs?) onSelect,
//       {Function? dismissed})  async {
//       SfDateRangePicker selected = await SfDateRangePicker(
//       maxDate: maxDate,
//       minDate: minDate,
//       initialDisplayDate:initialDisplayDate,
//       confirmText:StringProvider.ok,
//       cancelText:StringProvider.cancel,
//       view: DateRangePickerView.month,
//       monthViewSettings: const DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
//       selectionMode: DateRangePickerSelectionMode.range,
//       onSelectionChanged: onSelect,
//     );
//     // onSelect(selected);
//
//     dismissed?.call();
//   }
// }
