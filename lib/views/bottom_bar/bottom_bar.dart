import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      screenTransitionAnimation: const ScreenTransitionAnimation.none(),
      tabs: [
        PersistentTabConfig(
          screen: const CustomContainerScreen(Colors.red),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: 'Home',
          ),
        ),
        PersistentTabConfig(
          screen: const CustomContainerScreen(Colors.blue),
          item: ItemConfig(
            icon: const Icon(Icons.message),
            title: 'Messages',
          ),
        ),
        PersistentTabConfig(
          screen: const CustomContainerScreen(Colors.pink),
          item: ItemConfig(
            icon: const Icon(Icons.settings),
            title: 'Settings',
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}

class CustomContainerScreen extends StatelessWidget {
  const CustomContainerScreen(this.color, {super.key});
  final Color color;

  @override
  Widget build(BuildContext context) {
    print('build$color');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushScreenWithNavBar(
            context,
            const CustomContainerScreen(Colors.yellow),
          );
        },
      ),
      body: Container(
        color: color,
        height: 200,
        width: 200,
      ),
    );
  }
}
