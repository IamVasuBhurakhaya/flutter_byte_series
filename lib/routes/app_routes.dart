import 'package:flutter/material.dart';
import 'package:widgets_packages_app/packages/animated_text_kit.dart';
import 'package:widgets_packages_app/packages/fl_charts.dart';
import 'package:widgets_packages_app/packages/loading_animation_widget.dart';

class AppRoutes {
  static String loadingAnimationWidget = "/";
  static String animatedTextKit = "/animated_text_kit";
  static String flCharts = "fl_charts";

  static Map<String, Widget Function(BuildContext)> routes = {
    loadingAnimationWidget: (context) => const LoadingAnimationWidgetScreen(),
    animatedTextKit: (context) => const AnimatedTextKitScreen(),
    flCharts: (context) => const FlChartScreen(),
  };
}
