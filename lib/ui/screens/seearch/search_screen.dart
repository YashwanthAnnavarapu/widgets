import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:widgets/ui/screens/seearch/sample_widget.dart';
import 'package:widgets/ui/widgets/search_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static Future open(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SearchScreen(),
      ),
    );
  }

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  var searchSubject = BehaviorSubject<String>();
  Stream<String>? searchStream;

  @override
  void initState() {
    super.initState();
    searchStream = searchSubject.debounceTime(
      const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    searchSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Screen')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SearchWidget(
              hintText: 'Search Something',
              onTap: (value) => searchSubject.add(value),
            ),
            const SizedBox(height: 16),
            StreamBuilder<String>(
              stream: searchStream,
              builder: (context, snapshot) {
                String search = snapshot.data ?? '';
                return SampleWidget(
                  key: ValueKey(search),
                  search: search,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
