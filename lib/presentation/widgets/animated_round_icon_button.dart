import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/theme/colors.dart';

class AnimatedRoundIconButton extends StatefulWidget {
  const AnimatedRoundIconButton({
    Key? key,
    required this.size,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  final double size;
  final IconData iconData;
  final Function() onPressed;

  @override
  State<AnimatedRoundIconButton> createState() =>
      _AnimatedRoundIconButtonState();
}

class _AnimatedRoundIconButtonState extends State<AnimatedRoundIconButton> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _hover = true;
        });
      },
      onExit: (event) {
        setState(() {
          _hover = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          margin: const EdgeInsets.all(8),
          duration: const Duration(milliseconds: 200),
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _hover ? green : lightGrey,
          ),
          child: Center(
            child: FaIcon(
              widget.iconData,
              color: _hover ? white : darkGrey,
              size: widget.size * 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
