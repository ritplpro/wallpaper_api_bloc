class PhotosModal{
  String? alt;
  String? avg_color;
  int? height;
  int? id;
  bool? liked;
  String? photographer;
  int? photographer_id;
  String? photographer_url;
  SRC? src;
  String? url;
  int? width;

  PhotosModal({
    required this.alt,
    required this.avg_color,
    required this.height,
    required this.id,
    required this.url,
    required this.liked,
    required this.photographer,
    required this.photographer_id,
    required this.photographer_url,
    required this.src,
    required this.width,
});
factory PhotosModal.fromjson(Map<String,dynamic>json){
  return PhotosModal(
      alt: json["alt"],
      avg_color: json["avg_color"],
      height: json["height"],
      id: json["id"],
      url: json["url"],
      liked: json["liked"],
      photographer: json["photographer"],
      photographer_id: json["photographer_id"],
      photographer_url: json["photographer_url"],
      src: SRC.fromjson(json["src"]),
      width: json["width"]
  );
}

}



class SRC{
  String? landscape;
  String? large;
  String? large2x;
  String? medium;
  String? original;
  String? portrait;
  String? small;
  String? tiny;

  SRC({required this.landscape,
  required this.large,
    required this.large2x,
    required this.medium,
    required this.original,
    required this.portrait,
    required this.small,
    required this.tiny
  });


  factory SRC.fromjson(Map<String,dynamic>json){
    return SRC(
        landscape: json["landscape"],
        large: json["large"],
        large2x: json["large2x"],
        medium: json["medium"],
        original: json["original"],
        portrait: json["portrait"],
        small: json["small"],
        tiny: json["tiny"]
    );
  }
}