import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;



  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Newz",style: TextStyle(fontFamily: 'NewzFont',fontWeight: FontWeight.bold,color: Colors.grey[300]),),
        backgroundColor: Color(0xFF001F3F),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
