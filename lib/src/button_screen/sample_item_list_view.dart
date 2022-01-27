import 'package:flutter/material.dart';

import '../settings/settings_view.dart';

class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: const Center(
        child: Animated3DButton(),
      ),
    );
  }
}

class Animated3DButton extends StatefulWidget {
  const Animated3DButton({
    Key? key,
  }) : super(key: key);

  @override
  State<Animated3DButton> createState() => _Animated3DButtonState();
}

class _Animated3DButtonState extends State<Animated3DButton>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  // late final Animation<double> _curveAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          final progress = _animationController.value;
          final isAnimationComplete = progress >= 1.0;
          return Stack(
            children: [
              Positioned(
                top: 12,
                left: 4,
                right: 8,
                child: Container(
                  height: 50,
                  width: 250,
                  child: const Text(
                    "Mohon Ditekan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    border: Border.all(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: isAnimationComplete ? 12 : 4,
                left: isAnimationComplete ? 0 : 4,
                right: isAnimationComplete ? 16 : 8,
                child: GestureDetector(
                  onTapDown: (details) {
                    _animationController.forward();
                  },
                  onTapUp: (details) {
                    _animationController.reverse();
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    child: const Text(
                      "Mohon Ditekan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      border: Border.all(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
