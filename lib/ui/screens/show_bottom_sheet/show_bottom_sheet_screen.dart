import 'package:flutter/material.dart';
import 'package:widgets/ui/widgets/show_modal_bottom_sheet.dart';

import '../../widgets/show_draggable_bottom_sheet.dart';

class ShowBottomSheetScreen extends StatefulWidget {
  const ShowBottomSheetScreen({super.key});

  static Future open({required BuildContext context}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ShowBottomSheetScreen(),
      ),
    );
  }

  @override
  ShowBottomSheetScreenState createState() => ShowBottomSheetScreenState();
}

class ShowBottomSheetScreenState extends State<ShowBottomSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Sheet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                var a = await ShowModalBottomSheetWidget.open(
                  context: context,
                  child: ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                  ),
                );
              },
              child: const Text('Show Bottom Modal Sheet'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                var a = await ShowDraggableBottomSheetWidget.open(
                  context: context,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 20,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                  ),
                );
              },
              child: const Text('Show Draggable Bottom Modal Sheet'),
            ),
          ],
        ),
      ),
    );
  }
}
