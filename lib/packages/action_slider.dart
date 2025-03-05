import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';

class ActionSliderPackage extends StatefulWidget {
  const ActionSliderPackage({super.key});

  @override
  State<ActionSliderPackage> createState() => _ActionSliderPackageState();
}

class _ActionSliderPackageState extends State<ActionSliderPackage> {
  final _controller = ActionSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              ActionSlider.dual(
                width: 300.0,
                backgroundColor: Colors.blueGrey,
                startChild: const Text('Swipe Left'),
                endChild: const Text('Swipe Right'),
                icon: const Icon(Icons.sync, size: 28.0, color: Colors.white),
                startAction: (controller) async {
                  controller.loading();
                  await Future.delayed(const Duration(seconds: 2));
                  controller.success();
                  await Future.delayed(const Duration(seconds: 1));
                  controller.reset();
                },
                endAction: (controller) async {
                  controller.loading();
                  await Future.delayed(const Duration(seconds: 2));
                  controller.success();
                  await Future.delayed(const Duration(seconds: 1));
                  controller.reset();
                },
              ),
              const SizedBox(height: 20),
              ActionSlider.standard(
                sliderBehavior: SliderBehavior.stretch,
                width: 300.0,
                backgroundColor: Colors.black,
                toggleColor: Colors.redAccent,
                child: const Text(
                  'Stretch Slider',
                  style: TextStyle(color: Colors.white),
                ),
                action: (controller) async {
                  controller.loading();
                  await Future.delayed(const Duration(seconds: 2));
                  controller.success();
                  await Future.delayed(const Duration(seconds: 1));
                  controller.reset();
                },
              ),
              const SizedBox(height: 20),
              ActionSlider.standard(
                width: 300.0,
                direction: TextDirection.rtl,
                toggleColor: Colors.orange,
                backgroundColor: Colors.white,
                child: const Text('Slide from Right'),
                action: (controller) async {
                  controller.loading();
                  await Future.delayed(const Duration(seconds: 2));
                  controller.success();
                  await Future.delayed(const Duration(seconds: 1));
                  controller.reset();
                },
              ),
              const SizedBox(height: 20),
              ActionSlider.standard(
                rolling: true,
                width: 300.0,
                backgroundColor: Colors.purple,
                reverseSlideAnimationCurve: Curves.easeInOut,
                toggleColor: Colors.greenAccent,
                icon: const Icon(Icons.play_arrow_rounded, size: 30),
                child: const Text('Rolling Slider',
                    style: TextStyle(color: Colors.white)),
                action: (controller) async {
                  controller.loading();
                  await Future.delayed(const Duration(seconds: 2));
                  controller.success();
                  await Future.delayed(const Duration(seconds: 1));
                  controller.reset();
                },
              ),
              const SizedBox(height: 20),
              ActionSlider.custom(
                width: 300.0,
                controller: _controller,
                toggleWidth: 60.0,
                height: 60.0,
                backgroundColor: Colors.teal,
                foregroundChild: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: const Icon(Icons.check_rounded, color: Colors.white),
                ),
                foregroundBuilder: (context, state, child) => child!,
                backgroundChild: Center(
                  child: Text('Progress Slider',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                backgroundBuilder: (context, state, child) => ClipRect(
                  child: OverflowBox(
                    maxWidth: state.standardSize.width,
                    maxHeight: state.toggleSize.height,
                    child: child!,
                  ),
                ),
                action: (controller) async {
                  controller.loading();
                  await Future.delayed(const Duration(seconds: 2));
                  controller.success();
                  await Future.delayed(const Duration(seconds: 1));
                  controller.reset();
                },
              ),
              const SizedBox(height: 20),
              ActionSlider.standard(
                width: 300.0,
                backgroundColor: Colors.transparent,
                toggleColor: Colors.white,
                sliderBehavior: SliderBehavior.stretch,
                icon: const Icon(Icons.lock_open_rounded, color: Colors.black),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Colors.blue, Colors.pink],
                    ).createShader(bounds);
                  },
                  child: const Text('Gradient Slider',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                action: (controller) async {
                  controller.loading();
                  await Future.delayed(const Duration(seconds: 2));
                  controller.success();
                  await Future.delayed(const Duration(seconds: 1));
                  controller.reset();
                },
              ),
              const SizedBox(height: 20),
              ActionSlider.standard(
                width: 300.0,
                toggleColor: Colors.cyan,
                backgroundColor: Colors.black,
                loadingIcon: const SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: CircularProgressIndicator(
                      strokeWidth: 2.0, color: Colors.white),
                ),
                successIcon: const Icon(Icons.check_circle,
                    color: Colors.green, size: 30),
                child: const Text(
                  'Loading Effect',
                  style: TextStyle(color: Colors.white),
                ),
                action: (controller) async {
                  controller.loading();
                  await Future.delayed(const Duration(seconds: 2));
                  controller.success();
                  await Future.delayed(const Duration(seconds: 1));
                  controller.reset();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
