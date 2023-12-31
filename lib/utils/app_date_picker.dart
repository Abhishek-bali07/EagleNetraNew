import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../core/helpers/string_provider.dart';
import '../presentation/ui/theme.dart';
// import 'package:jadu_ride_driver/core/helpers/my_date_time.dart';


class AppDatePicker {
  AppDatePicker._();

  static show(BuildContext context, DateTime initialDate, DateTime fDate,
      DateTime lDate, Function(DateTime?) onSelect,
      {Function? dismissed}) async {
    var selected = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: fDate,
        lastDate: lDate,
        // locale: context.locale,
        confirmText: StringProvider.set,
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                      primary: AppColors.primary,
                      onPrimary: AppColors.White,
                      onSurface: AppColors.Acadia),
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                          primary: AppColors.primaryVariant))),
              child: child!);
        },
        helpText: "Please select");
    onSelect(selected);
    dismissed?.call();
  }
}
