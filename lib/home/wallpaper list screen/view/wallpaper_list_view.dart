



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home.dart';

class WallpaperListView extends StatefulWidget {
  String mQuery;
  String? mColor;

  WallpaperListView({super.key, required this.mQuery, this.mColor});

  @override
  State<WallpaperListView> createState() => _WallpaperListViewState();
}

List<PhotoModel> arrPhotos = [];

class _WallpaperListViewState extends State<WallpaperListView> {
  int mPageNo = 1;
  late ScrollController mController;
  int totalResults = 0;
  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    arrPhotos.clear();

    mController = ScrollController()
      ..addListener(() {
        if (mController.position.pixels ==
            mController.position.maxScrollExtent) {
          print("End of List");

          mPageNo++;
          context.read<WallpaperListBloc>().add(GetSearchWallpaper(
              query: widget.mQuery.replaceAll(" ", "%20"),
              mColor: widget.mColor,
              pageNo: mPageNo));
        }
      });

    context.read<WallpaperListBloc>().add(GetSearchWallpaper(
        query: widget.mQuery.replaceAll(" ", "%20"), mColor: widget.mColor));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.mQuery),
        ),
        backgroundColor: AppColors.BLACKCOLOR,
        // backgroundColor: Color(0xffD8EBED),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.mQuery,
                style: mTextStyle40(),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: BlocListener<WallpaperListBloc, WallpaperListState>(
                listener: (_, state) {
                  if (state.status == WallpaperListStatus.loading) {
                    /*return Center(
                      child: CircularProgressIndicator(),
                    );*/
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            mPageNo == 1 ? "Loading" : "Loading Next Page")));
                  } else if (state.status == WallpaperListStatus.error) {
                    /* return Center(child: Text(state.errorMsg));*/
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('{state.errorMsg}')));
                  } else if (state.status == WallpaperListStatus.loaded) {
                    totalResults = state.wallpaperModel!.total_results!;
                    arrPhotos.addAll(state.wallpaperModel!.photos!);
                    setState(() {});
                  }
                },
                child: Column(
                  children: [
                    Text(
                      '$totalResults wallpaper available',
                      style: mTextStyle22(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Image of the natural element
                    Expanded(
                      child: GridView.builder(
                        controller: mController,
                        itemCount: arrPhotos.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 11,
                          mainAxisSpacing: 11,
                          childAspectRatio: 9 / 16,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                             onTapListPhoto(context);
                            },
                            child: Container(
                              width: 150,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    arrPhotos[index].src!.portrait!,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
