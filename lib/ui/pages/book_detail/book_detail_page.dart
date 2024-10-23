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
          // 이건 숙제. 안드로이드에서 실행 해보고 userAgent가 뭔지, userAgent 어떻게 해야하는지?
          userAgent:
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
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
