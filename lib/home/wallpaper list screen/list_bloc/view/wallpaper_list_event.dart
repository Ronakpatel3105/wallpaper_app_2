import 'package:equatable/equatable.dart';

abstract class WallpaperListEvent extends Equatable {
  const WallpaperListEvent();

  @override
  List<Object?> get props => [];
}

class GetSearchWallpaper extends WallpaperListEvent {
  String query;
  String? mColor;
  int pageNo;

  GetSearchWallpaper({required this.query, this.mColor, this.pageNo = 1,});
}
