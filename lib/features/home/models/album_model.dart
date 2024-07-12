import 'dart:convert';

AlbumList albumsFromJson(String str) => AlbumList.fromJson(json.decode(str));

class AlbumList {
  final List<Album> albums;

  AlbumList({
    required this.albums,
  });

  factory AlbumList.fromJson(List<dynamic> json) {
    List<Album> albums = json.map((album) => Album.fromJson(album)).toList();
    return AlbumList(albums: albums);
  }

  List<Map<String, dynamic>> toJson() {
    return albums.map((album) => album.toJson()).toList();
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
    };
  }
}
