

import 'package:equatable/equatable.dart';

abstract class WallpaperEvent extends Equatable {
  const WallpaperEvent();
  @override
  List<Object?> get props => [];
}
class GetTrendingWallpaper extends WallpaperEvent{}