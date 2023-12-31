import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/presentation/widgets/animated_button_small.dart';

class AnimatedButtonDataItem {
  final IconData iconData;
  final String label;
  final String routeName;

  AnimatedButtonDataItem({
    required this.iconData,
    required this.label,
    required this.routeName,
  });
}

// ignore: must_be_immutable
class NavButtonsDesktop extends StatelessWidget {
  NavButtonsDesktop({
    Key? key,
    required this.currentRouteName,
    required this.animatedButtonDataItems,
  }) : super(key: key);

  String currentRouteName;
  final List<AnimatedButtonDataItem> animatedButtonDataItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: ListView.builder(
        itemCount: animatedButtonDataItems.length,
        itemBuilder: (context, index) {
          final item = animatedButtonDataItems[index];
          return Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12, right: 30),
            child: AnimatedButtonSmall(
              iconData: item.iconData,
              title: item.label,
              onPressed: () {
                context.goNamed(item.routeName);
              },
              isSelected: item.routeName == currentRouteName,
              size: const Size(200, 48),
            ),
          );
        },
      ),
    );
  }
}
