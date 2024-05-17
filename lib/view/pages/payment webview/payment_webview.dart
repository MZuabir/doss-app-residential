import 'package:doss_resident/constants/colors.dart';
import 'package:doss_resident/utils/size_config.dart';
import 'package:doss_resident/view/widgets/custom_snackbar.dart';
import 'package:doss_resident/view/widgets/loading.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebviewPage extends StatefulWidget {
  const PaymentWebviewPage(
      {super.key, required this.url, required this.onSuccess});
  final String url;
  final VoidCallback onSuccess;

  @override
  State<PaymentWebviewPage> createState() => _PaymentWebviewPageState();
}

class _PaymentWebviewPageState extends State<PaymentWebviewPage> {
  late WebViewController controller;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            if (progress >= 50) {
              isLoading = false;
              setState(() {});
            }
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
      ..loadRequest(Uri.parse(widget.url));
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGryClr,
      appBar: AppBar(
        backgroundColor: AppColors.darkGryClr,
        foregroundColor: Colors.white,
      ),
      body: ShowLoading(
        inAsyncCall: isLoading,
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
