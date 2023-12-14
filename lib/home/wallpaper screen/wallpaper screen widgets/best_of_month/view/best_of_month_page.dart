import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/view/api_helper.dart';
import '../../../bloc/view/wallpaper_bloc.dart';
import 'best_of_month_view.dart';

class BestOfMonthPage extends StatelessWidget {
  const BestOfMonthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WallpaperBloc(apiHelper: ApiHelper()),
        child: const BestOfMonthView());
  }
}
