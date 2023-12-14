import 'package:flutter/cupertino.dart';
import 'package:wallpaper_app/home/wallpaper%20details%20screen/view/wallpaper_details_view.dart';

class WallpaperDetailsPage extends StatelessWidget {
  const WallpaperDetailsPage({super.key, required img});

  @override
  Widget build(BuildContext context) {
    return  WallpaperDetailsView(img: 'state.wallpaperModel!.photos![index].src!.portrait!',);
  }
}
