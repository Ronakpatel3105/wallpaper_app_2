import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home.dart';

class WallpaperListBloc extends Bloc<WallpaperListEvent, WallpaperListState> {
  ApiHelper apiHelper;

  WallpaperListBloc({required this.apiHelper})
      : super(const WallpaperListState(status: WallpaperListStatus.initial)) {
    on<GetSearchWallpaper>((event, emit) async {
      emit(const WallpaperListState(status: WallpaperListStatus.loading));

      try {
        print(
            "Url : ${Urls.searchWallpaper}?query=${event.query}&color=${event.mColor ?? ""}&per_page=20&page=${event.pageNo}");
        var res = await apiHelper.getApi(
            url:
                "${Urls.searchWallpaper}?query=${event.query}&color=${event.mColor ?? ""}&per_page=20&page=${event.pageNo}");
        emit(WallpaperListState(
            status: WallpaperListStatus.loaded,
            wallpaperModel: DataPhotoModel.fromJson(res)));
      } catch (e) {
        emit(WallpaperListState(
          status: WallpaperListStatus.error,
          errorMsg: (e as MyException).ToString(),
        ));
      }
    });
  }
}
