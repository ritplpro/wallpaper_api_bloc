
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:wallpaper_api/wallpaper-bloc/wallpaper_event.dart';
import 'package:wallpaper_api/wallpaper-bloc/wallpaper_state.dart';

import '../api/api_helper.dart';
import '../api/api_urls.dart';
import '../api/app_exception.dart';
import '../api/data_modal.dart';
import '../repositry/wallpaper_repositry.dart';



class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  WallpaperRepositry wallpaperRepositry;
  WallpaperBloc({required this.wallpaperRepositry}) : super(WallpaperInitialState()) {

    on<getApiDataEvent>((event, emit)async {
      emit(WallpaperLoadingState());

      try{
        var rejson=await wallpaperRepositry.getlatestWallpaper();
        if(rejson!=null){
          var mresData=DataModal.fromjson(rejson);
          emit(WallpaperLoadedState(resData: mresData));
        }else{
          emit(WallpaperErrorState(errormsg: "uhh no !! error occurred"));
        }
      }catch(e){
        emit(WallpaperErrorState(errormsg: (e as AppException).toErrormsg()));
      }

    });
  }
}
