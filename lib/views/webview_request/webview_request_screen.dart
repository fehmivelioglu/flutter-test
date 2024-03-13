import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewRequestScreen extends StatefulWidget {
  const WebViewRequestScreen({super.key});

  @override
  State<WebViewRequestScreen> createState() => _WebViewRequestScreenState();
}

class _WebViewRequestScreenState extends State<WebViewRequestScreen> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setUserAgent('mobileAppStore')
          ..loadRequest(
              Uri.parse(
                  'http://localhost/php_v2/***',),
              headers: {'Content-Type': 'application/json; charset=utf-8'},
              method: LoadRequestMethod.post,
              body: Uint8List.fromList(utf8.encode(
                jsonEncode({'deneme':'merhaba','fav':'velio'}),
              ),),)
        // ..setNavigationDelegate(NavigationDelegate(
        //   onNavigationRequest: (request) => NavigationDecision.navigate,
        // )
        // )
        ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
