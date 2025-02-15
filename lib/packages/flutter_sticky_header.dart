import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class StickyHeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          for (int i = 0; i < 10; i++)
            SliverStickyHeader(
              header: Container(
                height: 50.0,
                color: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Header #$i',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                    leading: CircleAvatar(
                      child: Text('$index'),
                    ),
                    title: Text('List tile #$index'),
                  ),
                  childCount: 2,
                ),
              ),
            ),
          for (int i = 0; i < 5; i++)
            SliverStickyHeader(
              header: Container(
                height: 50.0,
                color: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Grid Header #$i',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Card(
                    color: Colors.amber,
                    child: Center(
                      child: Text('Grid Item #$index'),
                    ),
                  ),
                  childCount: 4,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
