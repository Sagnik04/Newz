import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TechWebView extends StatefulWidget {
  final String url;

  const TechWebView({super.key, required this.url});

  @override
  State<TechWebView> createState() => _TechWebViewState();
}

class _TechWebViewState extends State<TechWebView> {
  late WebViewController _techWebViewController;
  @override
  void initState() {
    _techWebViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Technology",style: TextStyle(fontFamily: 'NewzFont',fontWeight: FontWeight.bold,color: Colors.grey[300]),),
       backgroundColor: Color(0xFF001F3F),
     ),
     body: WebViewWidget(
       controller: _techWebViewController,
     ),

   );
  }}
