import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/constraints.dart';



class RepoWebScreen extends StatefulWidget {
  const RepoWebScreen({super.key, required this.url});

  final String url;


  @override
  State<RepoWebScreen> createState() => _RepoWebScreenState();
}

class _RepoWebScreenState extends State<RepoWebScreen> {
  late WebViewController controller;
  int value = 0;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    initController();
  }

  initController() {
    controller = WebViewController();
  }

  @override
  Widget build(BuildContext context) {
    print('value $value');
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
    };
    return Scaffold(
      // appBar: const CustomAppBar(
      //   title: 'Offer Screen',
      //   iconColor: whiteColor,
      //   iconBgColor: primaryColor,
      // ),
      body: WebViewWidget(
        controller: controller
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..enableZoom(true)
          ..setBackgroundColor(whiteColor)
          ..setNavigationDelegate(
            NavigationDelegate(
                onProgress: (int progress) {},
                onPageStarted: (String url) => print('start-url $url'),
                onPageFinished: (String url) {
                  print('url-finish $url');
                },
                onUrlChange: (UrlChange url) => print('url-changeing $url')),
          )
          ..loadRequest(
            Uri.parse(widget.url),
            headers: headers,
            method: LoadRequestMethod.get,
          ),
      ),
    );
  }
}
