import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class linkedinPage extends StatefulWidget {
  const linkedinPage({super.key});

  @override
  State<linkedinPage> createState() => _linkedinPageState();
}

class _linkedinPageState extends State<linkedinPage> {
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
      ..loadRequest(Uri.parse('https://www.linkedin.com/in/erlanggafs/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), body: WebViewWidget(controller: _controller!));
  }
}
