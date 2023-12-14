import 'package:equatable/equatable.dart';

import '../../model/view/data_photo_model.dart';

enum WallpaperStatus {
  initial,
  loading,
  loaded,
  error,
  interneterror,
}

class WallpaperState extends Equatable {
  final WallpaperStatus status;
  final DataPhotoModel? wallpaperModel;
  final String? errorMsg;

  const WallpaperState({
    required this.status,
    this.errorMsg,
    this.wallpaperModel,
  });

  static WallpaperState initial() => const WallpaperState(
        status: WallpaperStatus.initial,
      );

  static WallpaperState loading() => const WallpaperState(
        status: WallpaperStatus.loading,
      );

  static WallpaperState loaded() => WallpaperState(
        status: WallpaperStatus.loaded,
        wallpaperModel: DataPhotoModel(),
      );

  static WallpaperState error() => const WallpaperState(
        status: WallpaperStatus.error,
      );

  static WallpaperState interneterror() => const WallpaperState(
        status: WallpaperStatus.interneterror,
        errorMsg: "",
      );

  WallpaperState copyWith({
    WallpaperStatus? status,
    DataPhotoModel? wallpaperModel,
    String? errorMsg,
  }) =>
      WallpaperState(
        status: status ?? this.status,
        wallpaperModel: wallpaperModel ?? this.wallpaperModel,
        errorMsg: errorMsg ?? this.errorMsg
      );

  @override
  List<Object?> get props => [status, wallpaperModel,errorMsg];
}
