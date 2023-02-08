import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'navigate_back.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({Key? key, this.onPop}) : super(key: key);
  Function? onPop;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 0.16.sw,
      //backgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).primaryColor,
      shadowColor: Colors.transparent,
      leading: NavigateBack(onPop: onPop),
    );
  }

  @override
  Size get preferredSize => Size(1.sw, 0.14.sw);
}
