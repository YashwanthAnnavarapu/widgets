import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double? height;
  final double? width;
  final Color? shadowColor;
  final double radius;
  final Color? cardColor;
  final Border? border;

  const CustomCard({
    Key? key,
    required this.child,
    this.margin = const EdgeInsets.all(8),
    this.padding = const EdgeInsets.all(16),
    this.height,
    this.width,
    this.shadowColor,
    this.radius = 15,
    this.cardColor,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(radius),
        border: border,
      ),
      child: Card(
        elevation: 1,
        color: cardColor,
        clipBehavior: Clip.antiAlias,
        shadowColor: shadowColor ?? Colors.black.withOpacity(0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
