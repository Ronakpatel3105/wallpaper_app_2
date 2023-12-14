
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../home.dart';


class BestOfMonthView extends StatefulWidget {
  const BestOfMonthView({super.key});

  @override
  State<BestOfMonthView> createState() => BestOfMonthViewState();
}

class BestOfMonthViewState extends State<BestOfMonthView> {
  @override
  void initState() {
    super.initState();
    context.read<WallpaperBloc>().add(GetTrendingWallpaper());
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WallpaperBloc, WallpaperState>(
      builder: (context, state) {
        if (state.status == WallpaperStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == WallpaperStatus.error) {
          return const Center(
            child: Text('{state.errorMsg}'),
          );
        } else if (state.status == WallpaperStatus.loaded) {
          return SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: state.wallpaperModel!.photos!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var eachWall =
                    state.wallpaperModel?.photos![index].src!.portrait ??
                        "default app logo url";
                return InkWell(
                  onTap: () {
                    onTapBestofMonth(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 200,
                    width: 180,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(state
                                .wallpaperModel!.photos![index].src!.portrait!),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
