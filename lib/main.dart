import 'package:flutter/material.dart';
import 'package:widgets_packages_app/packages/ticket_widget.dart';
import 'package:widgets_packages_app/widgets/spot_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicketData(),
    );
  }
}
