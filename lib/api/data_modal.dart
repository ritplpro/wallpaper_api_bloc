

import 'package:wallpaper_api/api/photos_modal.dart';

class DataModal{
  String? next_page;
  int? page;
  int? per_page;
  List<PhotosModal>? photos;
  int? total_results;

  DataModal({required this.next_page,required this.page,required this.per_page,required this.photos,required this.total_results});


  factory DataModal.fromjson(Map<String,dynamic>json){
    List<PhotosModal> allPhotos=[];

    for(Map<String,dynamic> eachJson in json["photos"]){
      allPhotos.add(PhotosModal.fromjson(eachJson));
    }
    return DataModal(next_page: json["next_page"],
        page: json["page"],
        per_page: json["per_page"],
        photos: allPhotos,
        total_results: json["total_results"]
    );
  }


}