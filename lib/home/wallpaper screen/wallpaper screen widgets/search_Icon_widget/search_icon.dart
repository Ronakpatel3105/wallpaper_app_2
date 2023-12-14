import 'package:flutter/material.dart';

import '../../../constant/view/app_color.dart';

class SearchIcon extends StatelessWidget {
  VoidCallback? onTap;
  Color? mColor;
  IconData? mIcon;

  SearchIcon({
    this.onTap,
    this.mColor = AppColors.GRAYCOLOR,
    this.mIcon = Icons.search,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(mIcon, color: mColor),
    );
  }
}
