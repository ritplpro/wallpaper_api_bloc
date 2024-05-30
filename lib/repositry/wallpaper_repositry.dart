import 'package:wallpaper_api/api/api_helper.dart';
import 'package:wallpaper_api/api/api_urls.dart';

class WallpaperRepositry{
  ApiHelper apiHelper;


  WallpaperRepositry({required this.apiHelper});



  Future<dynamic> searchQueryWidget({required String mquery,String mcolor="",required int mpage}) async {

    try{
      return await  apiHelper.getApiData(url: "${Urls.search_url}?query=${mquery}&color=${mcolor}&page${mpage}");
    }catch(e){
      throw(e);
    }

  }

//

  Future<dynamic> getlatestWallpaper() async {

    try{
      return await  apiHelper.getApiData(url: "${Urls.latest_url}");
    }catch(e){
      throw(e);
    }

  }





}