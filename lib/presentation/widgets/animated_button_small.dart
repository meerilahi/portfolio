// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:portfolio/core/theme/colors.dart';

class AnimatedButtonSmall extends StatefulWidget {
  AnimatedButtonSmall({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onPressed,
    required this.isSelected,
    required this.size,
  }) : super(key: UniqueKey());

  final IconData iconData;
  final String title;
  final Function() onPressed;
  final bool isSelected;
  final Size size;

  @override
  State<AnimatedButtonSmall> createState() => _AnimatedButtonSmallState();
}

class _AnimatedButtonSmallState extends State<AnimatedButtonSmall>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimationContainer;
  late Animation<Color?> _colorAnimationIcon;
  late Animation<Color?> _colorAnimationText;
  bool hover = false;
  bool visibility = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _controller.addListener(() {
      if (_sizeAnimation.value > widget.size.width * 0.8) {
        visibility = true;
      } else {
        visibility = false;
      }
    });

    _sizeAnimation =
        Tween<double>(begin: widget.size.height, end: widget.size.width)
            .animate(_controller);

    _colorAnimationContainer = ColorTween(
      begin: widget.isSelected ? green : lightGrey,
      end: green,
    ).animate(_controller);

    _colorAnimationIcon = ColorTween(
      begin: widget.isSelected ? white : darkGrey,
      end: white,
    ).animate(_controller);
    _colorAnimationText = ColorTween(
      begin: green,
      end: white,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: MouseRegion(
        onEnter: (event) {
          hover = true;
          _controller.forward();
        },
        onExit: (event) {
          hover = false;
          _controller.reverse();
        },
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Container(
                    width: _sizeAnimation.value,
                    height: widget.size.height,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(widget.size.height / 2),
                      color: _colorAnimationContainer.value,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Visibility(
                          visible: visibility,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              widget.title.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: _colorAnimationText.value),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          widget.iconData,
                          color: _colorAnimationIcon.value,
                          size: 26,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
