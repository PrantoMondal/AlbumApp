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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(125, 125, 209, 1.0),
        title: const Text(
          "Details",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
