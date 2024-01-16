import 'dart:ui';

import 'package:flutter/material.dart';

class ShowDraggableBottomSheetWidget extends StatefulWidget {
  final Widget child;
  final double radius;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final bool snap;
  final List<double> snapSizes;
  final bool isBlurEnabled;
  final bool expand;

  static Future open({
    required BuildContext context,
    required Widget child,
    double radius = 32,
    double initialChildSize = 0.5,
    double minChildSize = 0,
    double maxChildSize = 1,
    bool snap = false,
    List<double> snapSizes = const [0.5],
    bool isBlurEnabled = true,
    bool expand = false,
  }) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: isBlurEnabled ? Colors.transparent : null,
      builder: (context) => ShowDraggableBottomSheetWidget(
        radius: radius,
        initialChildSize: initialChildSize,
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        snap: snap,
        snapSizes: snapSizes,
        isBlurEnabled: isBlurEnabled,
        expand: expand,
        child: child,
      ),
    );
  }

  const ShowDraggableBottomSheetWidget({
    super.key,
    required this.child,
    required this.radius,
    required this.initialChildSize,
    required this.minChildSize,
    required this.maxChildSize,
    required this.snap,
    required this.snapSizes,
    required this.isBlurEnabled,
    required this.expand,
  });

  @override
  ShowDraggableBottomSheetWidgetState createState() =>
      ShowDraggableBottomSheetWidgetState();
}

class ShowDraggableBottomSheetWidgetState
    extends State<ShowDraggableBottomSheetWidget> {
  final _controller = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: widget.initialChildSize,
      minChildSize: widget.minChildSize,
      maxChildSize: widget.maxChildSize,
      snap: widget.snap,
      snapSizes: widget.snapSizes,
      expand: widget.expand,
      controller: _controller,
      builder: (context, ScrollController scrollController) {
        return Stack(
          children: [
            if (widget.isBlurEnabled) ...[
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                  child: const SizedBox(),
                ),
              ),
            ],
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(widget.radius),
                ),
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 4,
                          width: 48,
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverList.list(
                    children: [
                      widget.child,
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
