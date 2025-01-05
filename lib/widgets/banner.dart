import 'package:flutter/material.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  _BannerScreenState createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  bool showBanner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Banner Widget',
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Colors.black87,
        elevation: 5,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black87,
            ),
          ),
          Center(
            child: TextButton(
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
              ),
              onPressed: () {
                setState(() {
                  showBanner = true;
                });
              },
              child: const Text(
                'Open',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if (showBanner)
            Align(
              alignment: Alignment.topCenter,
              child: MaterialBanner(
                padding: const EdgeInsets.all(16),
                content: const Text(
                  'This is a banner message.',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                leading: const CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: Icon(Icons.info, color: Colors.white),
                ),
                backgroundColor: Colors.white,
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        showBanner = false;
                      });
                    },
                    child: const Text(
                      'Dismiss',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                elevation: 5,
              ),
            ),
        ],
      ),
    );
  }
}
