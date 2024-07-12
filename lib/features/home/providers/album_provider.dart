import 'package:album_app/constants/api.dart';
import 'package:album_app/features/home/models/album_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AlbumsProvider extends ChangeNotifier {
  bool isLoading = true;
  String error = '';
  AlbumList albumList = AlbumList(albums: []);
  AlbumList serachedAlbum = AlbumList(albums: []);
  String searchText = '';
  getDataFromAPI() async {
    try {
      Response response = await http.get(Uri.parse(API.album_api));
      if (response.statusCode == 200) {
        albumList = albumsFromJson(response.body);
        notifyListeners();
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
  }
}
