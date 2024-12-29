import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BusinessWebView extends StatefulWidget {
  final String url;

  const BusinessWebView({super.key, required this.url});
  @override
  State<BusinessWebView> createState() => _BusinessWebViewState();
}

class _BusinessWebViewState extends State<BusinessWebView> {
  late WebViewController _webViewController;
  @override
  void initState() {
    _webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business",style: TextStyle(fontFamily: 'NewzFont',fontWeight: FontWeight.bold,color: Colors.grey[300]),),
        backgroundColor: Color(0xFF001F3F),
      ),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }}
