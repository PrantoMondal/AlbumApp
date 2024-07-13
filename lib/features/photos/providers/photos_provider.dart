import 'package:album_app/constants/api.dart';
import 'package:album_app/features/home/models/album_model.dart';
import 'package:album_app/features/photos/models/photo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class PhotosProvider extends ChangeNotifier {
  bool isLoading = true;
  String error = '';
  PhotoList photoList = PhotoList(photos: []);
  getPhotoFromAPI({required int id}) async {
    try {
      Response response =
          await http.get(Uri.parse("${API.photo_api}$id/photos"));
      if (response.statusCode == 200) {
        photoList = photosFromJson(response.body);
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
