import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:widgets_packages_app/packages/action_slider.dart';
import 'package:widgets_packages_app/packages/clay_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ActionSliderPackage(),
    );
  }
}
