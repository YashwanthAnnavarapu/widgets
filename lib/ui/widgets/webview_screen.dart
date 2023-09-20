import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebViewScreen({Key? key, required this.url, required this.title})
      : super(key: key);

  static Future open(
    BuildContext context, {
    required String url,
    required String title,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WebViewScreen(url: url, title: title),
      ),
    );
  }

  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {
  bool isLoading = true;
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (finish) {
            isLoading = false;
            setState(() {});
          },
          onNavigationRequest: (NavigationRequest request) async {
            if (request.url.startsWith('https://')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (widget.title.isEmpty)
          ? null
          : AppBar(
              title: Text(
                widget.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
      body: SafeArea(
        child: (isLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : WebViewWidget(controller: _controller),
      ),
    );
  }
}
