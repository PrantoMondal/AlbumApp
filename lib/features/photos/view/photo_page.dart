import 'package:album_app/features/details/view/details_page.dart';
import 'package:album_app/features/photos/providers/photos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoPage extends StatefulWidget {
  final int id; //The ID of the album for which photos will be displayed.
  // static const String routeName = '/photos';
  const PhotoPage({super.key, required this.id});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  void initState() {
    final provider = Provider.of<PhotosProvider>(context, listen: false);

    // Fetch photos from API for the specified album ID when the widget is initialized.
    provider.getPhotoFromAPI(id: widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhotosProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(125, 125, 209, 1.0),
        title: Text(
          // Display the album ID in the app bar title.
          "Album Id: ${provider.isLoading ? 0 : provider.photoList.photos[widget.id].albumId}",
          style: const TextStyle(fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: provider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      itemCount: provider.photoList.photos.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                      id: index,
                                    ),
                                  ));
                            },
                            child: ListTile(
                              leading: Hero(
                                //hero is used for animation
                                tag: "image",
                                child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.network(
                                      provider.photoList.photos[index].url),
                                ),
                              ),
                              title:
                                  Text(provider.photoList.photos[index].title),
                            ));
                      },
                    ))
                  ],
                ),
              ),
      ),
    );
  }
}
