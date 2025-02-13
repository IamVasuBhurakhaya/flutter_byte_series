import 'package:flutter/material.dart';
import 'package:widgets_packages_app/packages/photo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotoGalleryPage(),
    );
  }
}
