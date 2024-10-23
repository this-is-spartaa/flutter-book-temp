import 'package:flutter/material.dart';
import 'package:flutter_book_app/data/model/book.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({
    super.key,
    required this.title,
    required this.link,
  });

  final String title;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: InAppWebView(
        initialSettings: InAppWebViewSettings(
          useHybridComposition: true,
        ),
        onConsoleMessage: (controller, consoleMessage) {
          print(consoleMessage);
        },
        initialUrlRequest: URLRequest(
          url: WebUri(link),
        ),
      ),
    );
  }
}
