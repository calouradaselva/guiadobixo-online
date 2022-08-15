import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Iframe extends StatelessWidget {
  final String url;
  const Iframe({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
        initialUrl: Uri.dataFromString(
                "<html><body><iframe src=\"$url\"></iframe></body></html>",
                mimeType: "text/html")
            .toString(),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
