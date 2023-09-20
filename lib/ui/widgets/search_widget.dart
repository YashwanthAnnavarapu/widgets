import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final Function onTap;
  final String hintText;

  const SearchWidget({
    super.key,
    this.hintText = 'Search',
    required this.onTap,
  });

  @override
  SearchWidgetState createState() => SearchWidgetState();
}

class SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: Colors.black.withOpacity(0.5),
        ),
        suffixIcon: const Icon(Icons.search_rounded),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      ),
      onChanged: (value) => widget.onTap.call(value),
    );
  }
}
