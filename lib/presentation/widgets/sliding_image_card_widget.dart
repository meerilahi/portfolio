// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/data/models/portfolio_data_model.dart';
import 'package:portfolio/presentation/widgets/project_detail_dialog.dart';

class SlidingImageCard extends StatefulWidget {
  const SlidingImageCard({
    Key? key,
    required this.projectDetailItem,
  }) : super(key: key);
  final PortfolioItem projectDetailItem;

  @override
  State<SlidingImageCard> createState() => _SlidingImageCardState();
}

class _SlidingImageCardState extends State<SlidingImageCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Tween<Offset> _tween;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _tween = Tween<Offset>(
      begin: const Offset(1, 1),
      end: const Offset(0, 0),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return ProjectDetailDialog(
                  portfolioItem: widget.projectDetailItem,
                );
              });
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: MouseRegion(
            onEnter: (event) {
              Offset beginOffset = const Offset(1, 0);
              final loc = Offset(
                event.localPosition.dx.floor().toDouble(),
                event.localPosition.dy.floor().toDouble(),
              );
              final smallestSize = Size(
                constraints.smallest.width.floor().toDouble(),
                constraints.smallest.height.floor().toDouble(),
              );
              if (loc.dx <= 0 && loc.dy > 0) {
                // debugPrint("Left");
                beginOffset = const Offset(-1, 0);
              }
              if (loc.dx > 0 &&
                  loc.dy > 0 &&
                  loc.dx > smallestSize.width - 10) {
                // debugPrint("Right");
                beginOffset = const Offset(1, 0);
              }
              if (loc.dx > 0 && loc.dy <= 0) {
                // debugPrint("Top");
                beginOffset = const Offset(0, -1);
              }
              if (loc.dx > 0 &&
                  loc.dy > 0 &&
                  loc.dy > smallestSize.height - 10) {
                // debugPrint("Bottom");
                beginOffset = const Offset(0, 1);
              }
              _tween = Tween<Offset>(
                begin: beginOffset,
                end: const Offset(0, 0),
              );
              setState(() {});
              _controller.forward();
            },
            onExit: (event) {
              Offset endOffset = const Offset(1, 0);
              final loc = Offset(
                event.localPosition.dx.floor().toDouble(),
                event.localPosition.dy.floor().toDouble(),
              );
              final smallestSize = Size(
                constraints.smallest.width.floor().toDouble(),
                constraints.smallest.height.floor().toDouble(),
              );
              if (loc.dx <= 0 && loc.dy > 0) {
                // debugPrint("Left");
                endOffset = const Offset(-1, 0);
              }
              if (loc.dx > 0 &&
                  loc.dy > 0 &&
                  loc.dx > smallestSize.width - 10) {
                // debugPrint("Right");
                endOffset = const Offset(1, 0);
              }
              if (loc.dx > 0 && loc.dy <= 0) {
                // debugPrint("Top");
                endOffset = const Offset(0, -1);
              }
              if (loc.dx > 0 &&
                  loc.dy > 0 &&
                  loc.dy > smallestSize.height - 10) {
                // debugPrint("Bottom");
                endOffset = const Offset(0, 1);
              }
              _tween = Tween<Offset>(
                begin: endOffset,
                end: const Offset(0, 0),
              );
              setState(() {});
              _controller.reverse();
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image(
                    image: NetworkImage(widget.projectDetailItem.imageLink),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    errorBuilder: (a, b, c) {
                      return const Center(
                        child: Text("No Image"),
                      );
                    },
                  ),
                ),
                Positioned.fill(
                  child: SlideTransition(
                    position: _tween.animate(_controller),
                    child: Container(
                      color: green,
                      child: Center(
                        child: Text(
                          "View Detail".toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: white,
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
