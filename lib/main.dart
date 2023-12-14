import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wallpaper_app/home/home.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => WallpaperBloc(apiHelper: ApiHelper()),
      ),
      BlocProvider(
        create: (context) => WallpaperListBloc(apiHelper: ApiHelper()),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.WHITECOLOR),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.wallpaperView,
        routes: AppRoutes.routes());
  }
}
