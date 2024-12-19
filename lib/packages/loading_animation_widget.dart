import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimationWidgetScreen extends StatefulWidget {
  const LoadingAnimationWidgetScreen({super.key});

  @override
  State<LoadingAnimationWidgetScreen> createState() =>
      _LoadingAnimationWidgetScreenState();
}

class _LoadingAnimationWidgetScreenState
    extends State<LoadingAnimationWidgetScreen> {
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
              _buildLoadingBox(
                title: 'Ink Drop',
                widget: LoadingAnimationWidget.inkDrop(
                  color: Colors.blue,
                  size: 70,
                ),
              ),
              const SizedBox(height: 30),
              _buildLoadingBox(
                title: 'Staggered Dots Wave',
                widget: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.red,
                  size: 70,
                ),
              ),
              const SizedBox(height: 30),
              _buildLoadingBox(
                title: 'Flicker',
                widget: LoadingAnimationWidget.flickr(
                  rightDotColor: Colors.pink,
                  size: 70,
                  leftDotColor: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 30),
              _buildLoadingBox(
                title: 'Dots Triangle',
                widget: LoadingAnimationWidget.dotsTriangle(
                  color: Colors.purple,
                  size: 70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingBox({required String title, required Widget widget}) {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          widget,
        ],
      ),
    );
  }
}
