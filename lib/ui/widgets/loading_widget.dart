import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import 'three_size_dot.dart';

class LoadingWidget extends StatelessWidget {
  final bool _scaffold;
  final bool isAppBar;

  const LoadingWidget({super.key, this.isAppBar = false}) : _scaffold = false;

  const LoadingWidget.scaffold({super.key, this.isAppBar = false})
      : _scaffold = true;

  @override
  Widget build(BuildContext context) {
    var accentColor = MyColors.primaryColor;
    var child = Center(
      child: ThreeSizeDot(
        color_1: accentColor,
        color_2: accentColor,
        color_3: accentColor,
      ),
    );
    if (_scaffold) {
      return Scaffold(
        appBar: isAppBar ? AppBar() : null,
        body: child,
      );
    }
    return child;
  }
}
