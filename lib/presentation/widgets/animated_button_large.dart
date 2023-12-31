// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:portfolio/core/theme/colors.dart';

class AnimatedButtonLarge extends StatefulWidget {
  const AnimatedButtonLarge({
    Key? key,
    required this.iconData,
    required this.label,
    required this.onPressed,
    required this.size,
  }) : super(key: key);

  final IconData iconData;
  final String label;
  final Function() onPressed;
  final Size size;

  @override
  State<AnimatedButtonLarge> createState() => _AnimatedButtonLargeState();
}

class _AnimatedButtonLargeState extends State<AnimatedButtonLarge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _textAnimation;
  late final Animation _containerAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _textAnimation =
        ColorTween(begin: darkGrey, end: white).animate(_controller);
    _containerAnimation = Tween<double>(
      begin: widget.size.height,
      end: widget.size.width,
    ).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (evet) {
        _controller.forward();
      },
      onExit: (evet) {
        _controller.reverse();
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                width: widget.size.width,
                height: widget.size.height,
                decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: green),
                  borderRadius: BorderRadius.circular(widget.size.height / 2),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: Container(
                        width: _containerAnimation.value - 2,
                        height: widget.size.height - 2,
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius:
                              BorderRadius.circular(widget.size.height / 2),
                          border: Border.all(color: green),
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              widget.iconData,
                              size: widget.size.height - 15,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 0,
                      bottom: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.label,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: _textAnimation.value,
                                    fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
