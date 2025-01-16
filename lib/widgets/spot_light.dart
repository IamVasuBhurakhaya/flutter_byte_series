import 'package:flutter/material.dart';

class SpotlightEffect extends StatefulWidget {
  final Widget child;
  final Color spotlightColor;
  final double intensity;

  const SpotlightEffect({
    super.key,
    required this.child,
    this.spotlightColor = Colors.black,
    this.intensity = 0.7,
  });

  @override
  State<SpotlightEffect> createState() => _SpotlightEffectState();
}

class _SpotlightEffectState extends State<SpotlightEffect> {
  Offset spotlightPosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          spotlightPosition = details.localPosition;
        });
      },
      child: Stack(
        children: [
          ClipRect(
            child: widget.child,
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(
                radius: 100,
                position: spotlightPosition,
                color: widget.spotlightColor,
              ),
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: SpotlightPainter(
                color: Colors.black87,
                position: spotlightPosition,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final Color color;
  final Offset position;
  final double radius;

  BackgroundPainter({
    required this.color,
    required this.position,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black38;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    final path = Path();
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final paint2 = Paint()
      ..color = Colors.transparent
      ..blendMode = BlendMode.clear;

    path.addOval(Rect.fromCircle(center: position, radius: radius));
    path.fillType = PathFillType.evenOdd;

    final gradient = RadialGradient(
      colors: [
        Colors.transparent,
        color,
      ],
      stops: const [0.0, 1.0],
    ).createShader(
      Rect.fromCircle(center: position, radius: radius),
    );

    paint.shader = gradient;
    canvas.drawCircle(position, radius, paint);
    canvas.drawPath(path, paint2);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.position != position ||
        oldDelegate.radius != radius;
  }
}

class SpotlightPainter extends CustomPainter {
  final Color color;
  final Offset position;

  SpotlightPainter({
    required this.color,
    required this.position,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..blendMode = BlendMode.dstOut;

    final radius = size.width / 2;
    final gradient = RadialGradient(
      colors: [
        Colors.transparent,
        color,
      ],
      stops: const [0.0, 1.0],
    ).createShader(
      Rect.fromCircle(center: position, radius: radius),
    );

    paint.shader = gradient;
    canvas.drawCircle(position, radius, paint);
  }

  @override
  bool shouldRepaint(SpotlightPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.position != position;
  }
}
