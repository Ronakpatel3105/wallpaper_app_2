import 'package:flutter/cupertino.dart';

import '../my_style/my_space_style.dart';
import '../my_style/my_text_style.dart';

class TitleAndWidget extends StatelessWidget {
  String title;
  Widget child;

  TitleAndWidget({required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: mTextStyle20(),
          ),
          hSpacer(),
          child
        ],
      ),
    );
  }
}
