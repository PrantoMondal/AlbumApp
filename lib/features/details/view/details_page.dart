import 'package:album_app/features/photos/providers/photos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  final int id;
  static const String routeName = '/details';

  const DetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhotosProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(125, 125, 209, 1.0),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                const Text(
                  "Details",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  width: 50,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Hero(
                tag: "image",
                child: Image.network(provider.photoList.photos[id].url)),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Album Id: ${provider.photoList.photos[id].albumId}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Id: ${provider.photoList.photos[id].id}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Title: ${provider.photoList.photos[id].title}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
