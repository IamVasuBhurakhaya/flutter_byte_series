import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';

class ClayContainerPage extends StatelessWidget {
  const ClayContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Clay Containers Demo"),
        backgroundColor: Colors.grey[300],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ClayContainer(
              height: 150,
              width: 150,
              borderRadius: 20,
              color: Colors.grey[300]!,
              depth: 40,
              spread: 10,
              child: const Center(
                child: Text(
                  "Neumorphic!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClayContainer(
                height: 50,
                width: 120,
                borderRadius: 15,
                color: Colors.grey[300]!,
                depth: 30,
                spread: 5,
                child: const Center(
                  child: Text("Primary",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              ClayContainer(
                height: 50,
                width: 120,
                borderRadius: 15,
                color: Colors.grey[300]!,
                depth: -30,
                spread: 5,
                child: const Center(
                  child: Text("Secondary",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ClayContainer(
            height: 50,
            width: 250,
            borderRadius: 20,
            color: Colors.grey[300]!,
            depth: 30,
            spread: 5,
            child: const Center(
              child: Text("Large Button",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClayContainer(
                height: 50,
                width: 80,
                borderRadius: 15,
                color: Colors.grey[300]!,
                depth: 20,
                spread: 4,
                child: const Center(
                  child:
                      Icon(Icons.favorite, color: Colors.redAccent, size: 24),
                ),
              ),
              const SizedBox(width: 20),
              ClayContainer(
                height: 50,
                width: 80,
                borderRadius: 15,
                color: Colors.grey[300]!,
                depth: 20,
                spread: 4,
                child: const Center(
                  child:
                      Icon(Icons.thumb_up, color: Colors.blueAccent, size: 24),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
