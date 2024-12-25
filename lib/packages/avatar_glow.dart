import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class AvatarGlowScreen extends StatefulWidget {
  const AvatarGlowScreen({super.key});

  @override
  State<AvatarGlowScreen> createState() => _AvatarGlowScreenState();
}

class _AvatarGlowScreenState extends State<AvatarGlowScreen> {
  bool animate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              buildAvatarGlowBox(
                glowColor: Colors.blue,
                avatarImage: 'assets/images/avatar.png',
                radius: 50.0,
                startDelay: const Duration(milliseconds: 1000),
              ),
              const SizedBox(height: 27),
              buildAvatarGlowBox(
                glowColor: Colors.green,
                avatarImage: 'assets/images/avatar.png',
                radius: 50.0,
                startDelay: const Duration(milliseconds: 1500),
              ),
              const SizedBox(height: 27),
              buildAvatarGlowBox(
                glowColor: Colors.pink,
                avatarImage: 'assets/images/avatar.png',
                radius: 50.0,
                startDelay: const Duration(milliseconds: 2000),
              ),
              const SizedBox(height: 27),
              buildAvatarGlowBox(
                glowColor: Colors.yellow,
                avatarImage: 'assets/images/avatar.png',
                radius: 50.0,
                startDelay: const Duration(milliseconds: 2500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAvatarGlowBox({
    required Color glowColor,
    required String avatarImage,
    required double radius,
    required Duration startDelay,
    BoxShape glowShape = BoxShape.circle,
    Curve curve = Curves.fastOutSlowIn,
  }) {
    return Container(
      height: 190,
      width: 190,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Center(
        child: AvatarGlow(
          startDelay: startDelay,
          glowColor: glowColor,
          glowShape: glowShape,
          animate: animate,
          curve: curve,
          child: Material(
            elevation: 8.0,
            shape: const CircleBorder(),
            color: Colors.transparent,
            child: CircleAvatar(
              backgroundImage: AssetImage(avatarImage),
              radius: radius,
            ),
          ),
        ),
      ),
    );
  }
}
