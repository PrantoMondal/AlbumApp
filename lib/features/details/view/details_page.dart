import 'package:album_app/features/photos/providers/photos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/providers/album_provider.dart';

class DetailsPage extends StatelessWidget {
  final int id;
  static const String routeName = '/details';

  const DetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhotosProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Image.network(provider.photoList.photos[id].url),
        ],
      )),
    );
  }
}
