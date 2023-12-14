import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/view/api_helper.dart';
import '../../../api/view/my_exceptions.dart';
import '../../../api/view/urls.dart';
import '../../model/view/data_photo_model.dart';
import 'wallpaper_event.dart';
import 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  ApiHelper apiHelper;

  WallpaperBloc({required this.apiHelper})
      : super(const WallpaperState(
          status: WallpaperStatus.initial,
        )) {
    on<GetTrendingWallpaper>((event, emit) async {
      emit(state.copyWith(status: WallpaperStatus.loading));

      try {
        var res = await apiHelper.getApi(url: Urls.trendingWallpaper);
        emit(state.copyWith(
            status: WallpaperStatus.loaded,
            wallpaperModel: DataPhotoModel.fromJson(res)));
      } catch (e) {
        if (e is FetchDataException) {
          emit(state.copyWith(
            status: WallpaperStatus.interneterror,
            errorMsg: e.ToString(),
          ));
        } else {
          emit(
            state.copyWith(
                status: WallpaperStatus.error,
                errorMsg: (e as MyException).ToString()),
          );
        }
      }
    });
  }
}
