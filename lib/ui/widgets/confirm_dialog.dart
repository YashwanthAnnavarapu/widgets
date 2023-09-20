import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class ConfirmDialog {
  static Future<bool?> show(
    BuildContext context,
    String message, {
    String? title,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        var textTheme = Theme.of(context).textTheme;
        return AlertDialog(
          title: title != null ? Text(title, style: textTheme.bodyLarge) : null,
          content: Text(message, style: textTheme.titleLarge),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: MyColors.backgroundColor,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                'NO',
                style: textTheme.headlineSmall!.copyWith(fontSize: 15),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                'YES',
                style: textTheme.headlineSmall!.copyWith(fontSize: 15),
              ),
            ),
          ],
        );
      },
    );
  }
}
