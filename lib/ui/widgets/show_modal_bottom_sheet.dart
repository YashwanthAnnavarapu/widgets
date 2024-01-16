import 'dart:ui';

import 'package:flutter/material.dart';

class ShowModalBottomSheetWidget extends StatefulWidget {
  final double radius;
  final bool isBlurEnabled;
  final Widget child;

  const ShowModalBottomSheetWidget({
    super.key,
    required this.radius,
    required this.isBlurEnabled,
    required this.child,
  });

  static Future open({
    required BuildContext context,
    double radius = 32,
    bool isBlurEnabled = true,
    required Widget child,
  }) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ShowModalBottomSheetWidget(
        isBlurEnabled: isBlurEnabled,
        radius: radius,
        child: child,
      ),
    );
  }

  @override
  ShowModalBottomSheetWidgetState createState() =>
      ShowModalBottomSheetWidgetState();
}

class ShowModalBottomSheetWidgetState
    extends State<ShowModalBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
            child: const SizedBox(),
          ),
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const CircleAvatar(
                backgroundColor: Colors.black87,
                child: Icon(
                  Icons.close,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(widget.radius),
                  ),
                ),
                child: widget.child,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
