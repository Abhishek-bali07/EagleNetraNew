import 'package:eagle_netra/core/helpers/image_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../presentation/ui/theme.dart';
import '../common/constants.dart';

SplashLogo(){
  return Image.asset(ImageAssets.logo);
}


SplashTextLogo() {
  return Image.asset(ImageAssets.logotext);
}


ImageSourceDialog(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
    child: Container(
      height: 200.0,
      width: 150.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  highlightColor: Theme.of(context).colorScheme.primary,
                  color: AppColors.Black,
                  iconSize: 60,
                  onPressed: (){
                    Navigator.of(context).pop(Constants.camera);
                  },
                  icon: const Center(
                    child: Icon(
                      Icons.camera,
                    ),
                  )
              ),
              Text(
                Constants.camera,
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  highlightColor: Theme.of(context).colorScheme.primary,
                  color: AppColors.Black,
                  iconSize: 60,
                  onPressed: (){
                    Navigator.of(context).pop(Constants.gallery);
                  },
                  icon: const Center(
                    child: Icon(
                      Icons.folder,
                    ),
                  )
              ),
              Text(
                Constants.gallery,
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}