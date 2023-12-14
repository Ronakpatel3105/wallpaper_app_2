import 'package:flutter/material.dart';

import 'app_routes.dart';

onTapSearch(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.wallpaperListView);
}

onTapColor(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.wallpaperListView);
}

onTapCategories(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.wallpaperListView);
}

onTapBestofMonth(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.wallpaperDetailsView);
}

onTapListPhoto(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.wallpaperDetailsView);
}





