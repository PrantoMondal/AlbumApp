import 'package:album_app/features/details/view/details_page.dart';
import 'package:album_app/features/photos/providers/photos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PhotoPage extends StatefulWidget {
  final int id;
  // static const String routeName = '/photos';
  const PhotoPage({super.key, required this.id});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  void initState() {
    final provider = Provider.of<PhotosProvider>(context, listen: false);
    provider.getPhotoFromAPI(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhotosProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(125, 125, 209, 1.0),
      body: SafeArea(
        child: provider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                        Text(
                          "Album Id: ${provider.photoList.photos[widget.id].albumId}",
                          style: const TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GridView.custom(
                        gridDelegate: SliverWovenGridDelegate.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          pattern: [
                            const WovenGridTile(1),
                            const WovenGridTile(
                              5 / 7,
                              crossAxisRatio: 0.9,
                              alignment: AlignmentDirectional.centerEnd,
                            ),
                          ],
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                          childCount: provider.photoList.photos.length,
                          (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                        id: index,
                                      ),
                                    ));
                              },
                              child: Hero(
                                tag: "image",
                                child: Image.network(
                                    provider.photoList.photos[index].url),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
