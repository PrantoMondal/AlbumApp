import 'package:album_app/features/home/providers/album_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final provider = Provider.of<AlbumsProvider>(context, listen: false);
    provider.getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AlbumsProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              "Album",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: provider.albumList.albums.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Text(provider.albumList.albums[index].title),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
