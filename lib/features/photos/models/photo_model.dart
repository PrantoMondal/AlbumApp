import 'dart:convert';

PhotoList photosFromJson(String str) => PhotoList.fromJson(json.decode(str));

class PhotoList {
  List<Photo> photos;

  PhotoList({required this.photos});

  factory PhotoList.fromJson(List<dynamic> jsonList) {
    List<Photo> photos = jsonList.map((json) => Photo.fromJson(json)).toList();
    return PhotoList(photos: photos);
  }

  List<dynamic> toJson() {
    return photos.map((photo) => photo.toJson()).toList();
  }
}

class Photo {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }
}
