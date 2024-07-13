import 'package:album_app/features/details/view/details_page.dart';
import 'package:album_app/features/home/providers/album_provider.dart';
import 'package:album_app/features/home/view/home_page.dart';
import 'package:album_app/features/photos/view/photo_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/photos/providers/photos_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AlbumsProvider()),
        ChangeNotifierProvider(create: (context) => PhotosProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}
