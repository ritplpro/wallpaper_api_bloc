


import '../api/data_modal.dart';

abstract class WallpaperState {}

class WallpaperInitialState extends WallpaperState {}

class WallpaperLoadingState extends WallpaperState {}



class WallpaperLoadedState extends WallpaperState {
  DataModal resData;
  WallpaperLoadedState({required this.resData});
}


class WallpaperErrorState extends WallpaperState {
  String errormsg;
  WallpaperErrorState({required this.errormsg});
}
