import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class facebookPage extends StatefulWidget {
  const facebookPage({super.key});

  @override
  State<facebookPage> createState() => _facebookPageState();
}

class _facebookPageState extends State<facebookPage> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.facebook.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), body: WebViewWidget(controller: _controller!));
  }
}
