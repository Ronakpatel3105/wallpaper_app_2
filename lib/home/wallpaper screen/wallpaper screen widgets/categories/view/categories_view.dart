import 'package:flutter/material.dart';

import '../../../../home.dart';



class CategoriesView extends StatelessWidget {
  var data = ListCategories.categoriesName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 750,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 16 / 9),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onTapCategories(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(data[index]["img"]),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  data[index]["name"],
                  style: mTextStyle16(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
