import 'package:flutter/material.dart';

import '../../home.dart';

class WallpaperDetailsView extends StatelessWidget {
  String img;
  double? mWidth;
  double? mHeight;

  WallpaperDetailsView({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    mWidth = MediaQuery.of(context).size.width;
    mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(img), fit: BoxFit.cover)),
          ),
          Positioned(
            top: 70,
            left: 34,
            child: CustomButton(
              onTap: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back_ios_new,
              color: AppColors.WHITECOLOR,
              title: 'Wallpaper download',
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(21.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onTap: () {
                      downloadWallpaper(img);
                    },
                    icon: Icons.download,
                    color: AppColors.WHITECOLOR,
                    title: 'Wallpaper download',
                  ),
                  wSpacer(mWidth: 21),
                  CustomButton(
                    onTap: () {
                      setWallpaper(img, mHeight!, mWidth!);
                    },
                    icon: Icons.wallpaper,
                    color: AppColors.WHITECOLOR,
                    title: 'Apply wallpaper',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
