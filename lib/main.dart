import 'package:flutter/material.dart';
import 'package:widgets_packages_app/widgets/spot_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SpotlightEffect(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "The quick brown fox jumps over the lazy dog",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const FlutterLogo(size: 80),
                      const SizedBox(height: 20),
                      const Text(
                        "John Doe",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien egestas tincidunt. 
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien egestas tincidunt.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien egestas tincidunt.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien egestas tincidunt.""",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Date: 2022-10-10",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
