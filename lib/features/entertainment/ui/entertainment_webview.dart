import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EntertainmentWebView extends StatefulWidget {
  final String url;

  const EntertainmentWebView({super.key, required this.url});
  @override
  State<EntertainmentWebView> createState() => _EntertainmentWebViewState();
}

class _EntertainmentWebViewState extends State<EntertainmentWebView> {
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
        title: Text("Entertainment",style: TextStyle(fontFamily: 'NewzFont',fontWeight: FontWeight.bold,color: Colors.grey[300]),),
        backgroundColor: Color(0xFF001F3F),
      ),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }}
