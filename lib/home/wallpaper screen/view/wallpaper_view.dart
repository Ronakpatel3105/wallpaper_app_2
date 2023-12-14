import 'package:flutter/material.dart';
import 'package:wallpaper_app/home/routes/view/app_navigation.dart';

import '../../home.dart';

class WallPaperView extends StatefulWidget {
  const WallPaperView({super.key});

  @override
  State<WallPaperView> createState() => _WallPaperViewState();
}

class _WallPaperViewState extends State<WallPaperView> {
  TextEditingController searchController = TextEditingController();

  var searchQuery = "nature"; //default
  var searchColorTone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffdbebf0),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
            child: CustomTextFormField(
              controller: searchController,
              hintText: "Find Wallpaper",
              suffix: SearchIcon(onTap: () {
                onTapSearch(context);

                arrPhotos.clear();
              }),
            ),
          ),
          hSpacer(),
          TitleAndWidget(
            title: 'Best Of the Month',
            child: const BestOfMonthPage(),
          ),
          hSpacer(),
          TitleAndWidget(title: "The color tone", child: const ColorTonView()),
          hSpacer(),
          TitleAndWidget(title: 'Categories', child: CategoriesView()),
        ])));
  }
}
