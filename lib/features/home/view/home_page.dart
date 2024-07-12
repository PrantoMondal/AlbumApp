import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              "Album",
              style: TextStyle(fontSize: 30),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: double.maxFinite,
                  // color: Colors.red,
                  child: GridView.custom(
                    semanticChildCount: 1,
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        QuiltedGridTile(2, 2),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 2),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) => Text("$index"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
