import 'package:album_app/constants/api.dart';
import 'package:album_app/features/home/models/album_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AlbumsProvider extends ChangeNotifier {
  bool isLoading = true;
  String error = '';
  AlbumList albumList = AlbumList(albums: []);

  getDataFromAPI() async {
    try {
      Response response = await http.get(Uri.parse(API.album_api));
      if (response.statusCode == 200) {
        // Check if request was successful (status code 200) and, Parse JSON response body into AlbumList using generated model function
        albumList = albumsFromJson(response.body);
        notifyListeners(); // Notify listeners of changes in data
      } else {
        error = response.statusCode.toString();
        // Set error message with HTTP status code if request fails
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false; // Update isLoading flag
  }
}
