import 'package:flutter/material.dart';
import 'package:widgets/ui/screens/display/display_screen.dart';
import 'package:widgets/ui/screens/form_fields/form_fields_screen.dart';
import 'package:widgets/ui/screens/seearch/search_screen.dart';
import 'package:widgets/ui/screens/show_bottom_sheet/show_bottom_sheet_screen.dart';
import 'package:widgets/ui/widgets/custom_card.dart';
import 'package:widgets/ui/widgets/dashed_line.dart';
import 'package:widgets/ui/widgets/details_tile.dart';
import 'package:widgets/ui/widgets/empty_widget.dart';
import 'package:widgets/ui/widgets/gallery_screen.dart';
import 'package:widgets/ui/widgets/grid_wrap.dart';
import 'package:widgets/ui/widgets/image_from_net.dart';
import 'package:widgets/ui/widgets/mont_picker.dart';
import 'package:widgets/ui/widgets/reverse_details_tile.dart';
import 'package:widgets/ui/widgets/webview_screen.dart';

import '../../widgets/avatar.dart';
import '../../widgets/confirm_dialog.dart';
import '../display/display_screen_2.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static Future open(BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
      (_) => false,
    );
  }

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> widgets = [];

  void initialize() {
    widgets = [
      {
        'title': 'Avatar',
        'screen': 'display',
        'widget': const Avatar(
          radius: 50,
          size: 100,
        ),
      },
      {
        'title': 'Custom Card',
        'screen': 'display',
        'widget': const CustomCard(
          height: 100,
          width: 200,
          child: Text('Hello World'),
        ),
      },
      {
        'title': 'Horizontal Dashed Line',
        'screen': 'display',
        'widget': const HorizontalDashedLine(),
      },
      {
        'title': 'Vertical Dashed Line',
        'screen': 'display',
        'widget': const VerticalDashedLine(
          heightContainer: 250,
        ),
      },
      {
        'title': 'DatePicker',
        'screen': 'form',
      },
      {
        'title': 'Details Tile',
        'screen': 'display2',
        'widget': const DetailsTile(
          title: Text('Title'),
          value: Text('Value'),
        ),
      },
      {
        'title': 'Reverse Details Tile',
        'screen': 'display2',
        'widget': const ReverseDetailsTile(
          title: Text('Title'),
          value: Text('Value'),
        ),
      },
      {
        'title': 'Confirm Dialog',
        'screen': 'display',
        'widget': ElevatedButton(
          onPressed: () async {
            var res = await ConfirmDialog.show(context, 'Do you like cricket');
            print(res);
          },
          child: const Text('Click Here'),
        ),
      },
      {
        'title': 'Empty Widget',
        'screen': 'display',
        'widget': const EmptyWidget(),
      },
      {
        'title': 'Gallery Screen',
        'screen': 'galleryScreen',
      },
      {
        'title': 'Grid Wrap Widget',
        'screen': 'display',
        'widget': GridWrap(
          count: 2,
          spacing: 16,
          children: List.generate(
            2,
            (index) => Container(color: Colors.blueAccent),
          ),
        ),
      },
      {
        'title': 'Image From Net Widget',
        'screen': 'display',
        'widget': ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: ImageFromNet(
            fit: BoxFit.contain,
            borderRadius: BorderRadius.circular(25),
            imageUrl: 'https://wallpapercave.com/wp/6jJbGcg.jpg',
          ),
        ),
      },
      {
        'title': 'Empty Widget',
        'screen': 'display',
        'widget': const EmptyWidget(),
      },
      {
        'title': 'Month Picker Widget',
        'screen': 'display',
        'widget': MonthPicker(
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
          initialDate: DateTime.now(),
          onTap: () {},
        ),
      },
      {
        'title': 'Search Widget',
        'screen': 'search',
      },
      {
        'title': 'TimePicker',
        'screen': 'form',
      },
      {
        'title': 'WebView Screen',
        'screen': 'webview',
      },
      {
        'title': 'Show All Bottom Sheets Screen',
        'screen': 'bottomSheet',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    initialize();
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 16,
        title: const Text('Widgets'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 777)).then(
            (value) => setState(() {}),
          );
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: widgets.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade50),
              ),
              child: InkWell(
                onTap: () {
                  switch (widgets[index]['screen']) {
                    case 'display':
                      DisplayScreen.open(
                        context,
                        widget: widgets[index]['widget'],
                      );
                      break;
                    case 'display2':
                      DisplayScreen2.open(
                        context,
                        widget: widgets[index]['widget'],
                      );
                      break;
                    case 'form':
                      FormFieldsScreen.open(context);
                      break;
                    case 'galleryScreen':
                      GalleryScreen.open(
                        context,
                        images: [
                          'https://wallpapercave.com/wp/6jJbGcg.jpg',
                          'https://wallpapercave.com/wp/dobrNev.jpg',
                        ],
                      );
                      break;
                    case 'search':
                      SearchScreen.open(context);
                      break;
                    case 'webview':
                      WebViewScreen.open(
                        context,
                        url: 'https://flutter.dev',
                        title: 'Webview Screen',
                      );
                      break;
                    case 'bottomSheet':
                      ShowBottomSheetScreen.open(context: context);
                      break;
                    default:
                      return;
                  }
                },
                child: Row(
                  children: [
                    Text('${index + 1}. ', style: textTheme.titleLarge),
                    Text(widgets[index]['title'], style: textTheme.titleLarge),
                    const Spacer(),
                    const Icon(
                      size: 16,
                      Icons.arrow_forward_ios_rounded,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
