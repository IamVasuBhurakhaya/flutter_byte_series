import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class ExpandableFabPage extends StatefulWidget {
  const ExpandableFabPage({super.key});

  @override
  _ExpandableFabPageState createState() => _ExpandableFabPageState();
}

class _ExpandableFabPageState extends State<ExpandableFabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(
          "Expandable FAB",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      backgroundColor: Colors.black54,
      body: const Center(
        child: Column(
          children: [],
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        distance: 120.0,
        children: [
          FloatingActionButton.small(
            heroTag: null,
            backgroundColor: Colors.pinkAccent,
            child: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Edit Action"),
                    backgroundColor: Colors.pinkAccent),
              );
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            backgroundColor: Colors.purpleAccent,
            child: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Search Action"),
                    backgroundColor: Colors.purpleAccent),
              );
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            backgroundColor: Colors.tealAccent,
            child: const Icon(Icons.camera_alt, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Camera Action"),
                    backgroundColor: Colors.tealAccent),
              );
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            backgroundColor: Colors.blueAccent,
            child: const Icon(Icons.share, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Share Action"),
                    backgroundColor: Colors.blueAccent),
              );
            },
          ),
        ],
      ),
    );
  }
}
