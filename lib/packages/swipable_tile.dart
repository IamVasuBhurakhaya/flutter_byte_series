import 'package:flutter/material.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

class SwipeableTilePage extends StatefulWidget {
  const SwipeableTilePage({super.key});

  @override
  _SwipeableTilePageState createState() => _SwipeableTilePageState();
}

class _SwipeableTilePageState extends State<SwipeableTilePage> {
  List<String> items = ['Edit Profile', 'Notifications', 'Dark Mode'];

  void showDecorativeSnackbar(BuildContext context, String action) {
    final snackBar = SnackBar(
      content: Text(
        '$action completed!',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor:
          action == 'Deleted' ? Colors.redAccent : Colors.greenAccent,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      elevation: 10.0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: SwipeableTile(
              color: Colors.transparent,
              swipeThreshold: 0.3,
              direction: SwipeDirection.horizontal,
              onSwiped: (direction) {
                if (direction == SwipeDirection.endToStart) {
                  setState(() {
                    items.removeAt(index);
                  });
                  showDecorativeSnackbar(context, 'Deleted');
                } else if (direction == SwipeDirection.startToEnd) {
                  showDecorativeSnackbar(context, 'Archived');
                }
              },
              backgroundBuilder: (context, direction, progress) {
                if (direction == SwipeDirection.endToStart) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    alignment: Alignment.centerRight,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  );
                } else if (direction == SwipeDirection.startToEnd) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    alignment: Alignment.centerLeft,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.archive, color: Colors.white),
                    ),
                  );
                }
                return Container();
              },
              key: UniqueKey(),
              child: Card(
                elevation: 8.0,
                shadowColor: Colors.deepPurple.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.deepPurple.shade300,
                child: ListTile(
                  leading: const Icon(Icons.settings, color: Colors.white),
                  title: Text(
                    items[index],
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    print('${items[index]} tapped');
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
