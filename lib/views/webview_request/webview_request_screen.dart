import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewRequestScreen extends StatelessWidget {
  const WebViewRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: WebView(
          gestureNavigationEnabled: true,
          javascriptMode: JavascriptMode.unrestricted,
          userAgent: 'mobileAppStore',
          onWebViewCreated: (WebViewController webViewController) async {
            webViewController.loadRequest(
              WebViewRequest(
                  uri: Uri.parse('http://localhost/php/nk_api/'),
                  method: WebViewRequestMethod.post,
                  body: Uint8List.fromList(utf8.encode(
                    jsonEncode("{'deneme':'merhaba','fav':'velio'}"),
                  ))),
            );
          },
          javascriptChannels: <JavascriptChannel>{},
          navigationDelegate: (NavigationRequest request) async {
            return NavigationDecision.navigate;
          },
        ),
      ),
    );
  }
}
