import 'package:flutter/material.dart';
import 'package:wallpaper_app/home/home.dart';

class AppRoutes {
  static const String splashView = '/splash_view';

  static const String wallpaperView = '/wallpaper_view';

  static const String wallpaperDetailsView = '/wallpaper_details_view';

  static const String wallpaperListView = '/wallpaper_list_view';

  static Map<String, WidgetBuilder> routes ()=> {
    splashView: (context) => const SplashView(),
    wallpaperView: (context) => const WallPaperView(),
    wallpaperDetailsView: (context) => WallpaperDetailsView(img: ""),
    wallpaperListView: (context) => WallpaperListView(mQuery: '',),
  };
}
