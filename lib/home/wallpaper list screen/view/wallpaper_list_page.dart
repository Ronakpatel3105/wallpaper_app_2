import 'package:flutter/cupertino.dart';
import 'package:wallpaper_app/home/home.dart';

class WallpaperListPage extends StatelessWidget {
  const WallpaperListPage({super.key, required String mQuery, required mColor, });

  @override
  Widget build(BuildContext context) {
    return WallpaperListView(
     mQuery: "",
    );
  }
}
