import 'package:flutter/material.dart';

class SampleWidget extends StatelessWidget {
  final String search;

  const SampleWidget({super.key, required this.search});

  @override
  Widget build(BuildContext context) {
    return Text(search);
  }
}
