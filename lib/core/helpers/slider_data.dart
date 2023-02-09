
import 'image_assets.dart';

class SliderData{
  SliderData(this.image,this.title,this.message);
  final String image;
  final String title;
  final String message;

  static List<SliderData> sliderData = [
    SliderData(
        ImageAssets.screenone,
        "Smart ID Card",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel odio sit amet."
    ),
    SliderData(
        ImageAssets.screentwo,
        "Route Tracking",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel odio sit amet."
    ),
    SliderData(
        ImageAssets.screenthree,
        "Geo Fencing",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel odio sit amet."
    ),

  ];
}