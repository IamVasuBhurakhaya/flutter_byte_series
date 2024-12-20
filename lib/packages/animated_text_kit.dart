import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedTextKitScreen extends StatefulWidget {
  const AnimatedTextKitScreen({super.key});

  @override
  State<AnimatedTextKitScreen> createState() => _AnimatedTextKitScreenState();
}

class _AnimatedTextKitScreenState extends State<AnimatedTextKitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildAnimatedTextBox(
                title: 'Typewriter Animation',
                widget: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flutter Byte!',
                      textStyle: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      speed: const Duration(milliseconds: 300),
                    ),
                  ],
                  isRepeatingAnimation: true,
                ),
              ),
              const SizedBox(height: 30),
              buildAnimatedTextBox(
                title: 'Scale Animation',
                widget: AnimatedTextKit(
                  animatedTexts: [
                    ScaleAnimatedText(
                      'Flutter Byte!',
                      textStyle: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      duration: const Duration(seconds: 3),
                    ),
                  ],
                  isRepeatingAnimation: true,
                ),
              ),
              const SizedBox(height: 30),
              buildAnimatedTextBox(
                title: 'Wavy Animation',
                widget: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'Flutter Byte',
                      textStyle: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      speed: const Duration(milliseconds: 300),
                    ),
                  ],
                  isRepeatingAnimation: true,
                ),
              ),
              const SizedBox(height: 30),
              buildAnimatedTextBox(
                title: 'Colorize Animation',
                widget: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Flutter Byte!',
                      textStyle: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      colors: [
                        Colors.yellow,
                        Colors.blue,
                        Colors.green,
                        Colors.orange,
                        Colors.pink
                      ],
                      speed: const Duration(milliseconds: 400),
                    ),
                  ],
                  isRepeatingAnimation: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAnimatedTextBox({required String title, required Widget widget}) {
    return Container(
      width: 270,
      height: 180,
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Center(child: widget),
          ),
        ],
      ),
    );
  }
}
