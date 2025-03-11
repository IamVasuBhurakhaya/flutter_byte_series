import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

class FlipCardPage extends StatefulWidget {
  @override
  _FlipCardPageState createState() => _FlipCardPageState();
}

class _FlipCardPageState extends State<FlipCardPage> {
  final FlipCardController _controller = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlipCard(
          rotateSide: RotateSide.left,
          controller: _controller,
          frontWidget: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                color: Colors.blueGrey,
                width: 300,
                height: 200,
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: const Text(
                  "This is the front of the card.\nTap to flip back!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          backWidget: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            color: Colors.blueGrey.shade900,
            child: Container(
              width: 300,
              height: 200,
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              child: Text(
                "This is the back of the card.\nTap to flip back!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.flipcard(); // Manually flipping the card
        },
        child: Icon(Icons.flip),
      ),
    );
  }
}
