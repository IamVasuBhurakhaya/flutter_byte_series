import 'package:flutter/material.dart';
import 'package:widgets_packages_app/packages/loading_animation_widget.dart';

class AppRoutes {
  static String loadingAnimationWidget = "/";

  static Map<String, Widget Function(BuildContext)> routes = {
    loadingAnimationWidget: (context) => const LoadingAnimationWidgetScreen()
  };
}
