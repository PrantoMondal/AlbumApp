import 'package:album_app/features/home/models/album_model.dart';
import 'package:album_app/features/home/providers/album_provider.dart';
import 'package:album_app/features/photos/view/photo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  List<Album> _filteredAlbums = [];
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AlbumsProvider>(context, listen: false);
    provider.getDataFromAPI();

    _searchController.addListener(() {
      filterAlbums();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void filterAlbums() {
    final provider = Provider.of<AlbumsProvider>(context, listen: false);
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredAlbums = provider.albumList.albums
          .where((album) => album.title.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AlbumsProvider>(context);
    if (_searchController.text.isEmpty) {
      _filteredAlbums = provider.albumList.albums;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(125, 125, 209, 1.0),
        title: const Text(
          "Album",
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              !isVisible
                  ? const SizedBox()
                  : TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search albums...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: _filteredAlbums.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhotoPage(
                                    id: _filteredAlbums[index].id,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              color: _filteredAlbums[index].id.isEven
                                  ? Colors.grey.shade600
                                  : Colors.white,
                              width: double.infinity,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    _filteredAlbums[index].title,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        overflow: TextOverflow.fade),
                                    softWrap: false,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
