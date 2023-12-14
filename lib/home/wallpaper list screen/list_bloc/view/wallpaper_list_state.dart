import 'package:equatable/equatable.dart';

import '../../../wallpaper screen/model/view/data_photo_model.dart';

enum WallpaperListStatus {
  initial,
  loading,
  loaded,
  error,
  interneterror,
}

class WallpaperListState extends Equatable {
  final WallpaperListStatus status;
  final DataPhotoModel? wallpaperModel;
  final String? errorMsg;

  const WallpaperListState({
    required this.status,
    this.errorMsg,
    this.wallpaperModel,
  });

  static WallpaperListState initial() => const WallpaperListState(
        status: WallpaperListStatus.initial,
      );

  static WallpaperListState loading() => const WallpaperListState(
        status: WallpaperListStatus.loading,
      );

  static WallpaperListState loaded() => WallpaperListState(
        status: WallpaperListStatus.loaded,
        wallpaperModel: DataPhotoModel(),
      );

  static WallpaperListState error() => const WallpaperListState(
        status: WallpaperListStatus.error,
      );

  static WallpaperListState interneterror() => const WallpaperListState(
        status: WallpaperListStatus.interneterror,
        errorMsg: "",
      );

  WallpaperListState copyWith({
    WallpaperListStatus? status,
    DataPhotoModel? wallpaperModel,
    String? errorMsg,
  }) =>
      WallpaperListState(
        status: status ?? this.status,
        wallpaperModel: wallpaperModel ?? this.wallpaperModel,
        errorMsg: errorMsg ?? this.errorMsg
      );

  @override
  List<Object?> get props => [status, wallpaperModel,errorMsg];
}
