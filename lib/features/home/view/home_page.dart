import 'package:album_app/features/home/providers/album_provider.dart';
import 'package:album_app/features/photos/view/photo_page.dart';
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
      backgroundColor: const Color.fromRGBO(125, 125, 209, 1.0),
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhotoPage(
                            id: index + 1,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: index.isOdd ? Colors.grey.shade600 : Colors.white,
                      width: double.infinity,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          provider.albumList.albums[index].title,
                          style: const TextStyle(
                              fontSize: 18, overflow: TextOverflow.fade),
                          softWrap: false,
                        ),
                      )),
                    ),
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
