
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'appbar.dart';

@RoutePage()
class InAppWeb extends StatefulWidget {
  final String url;
  final bool isAppBarNeeded;
  final String? text;

  const InAppWeb(
      {super.key, required this.url, this.isAppBarNeeded = true, this.text});

  @override
  State<InAppWeb> createState() => _InAppWebState();
}

class _InAppWebState extends State<InAppWeb> {
  InAppWebViewController? webViewController;
  PullToRefreshController? pullToRefreshController;

  String url = "";
  double progress = 0;
  String error = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isAppBarNeeded
          ? AppBarN(
              text: widget.text ?? "",
            )
          : null,
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            onLoadStart: (controller, url) {},
            onProgressChanged: (controller, progress) {
              setState(() {
                this.progress = progress / 100;
              });
            },
            onLoadError: (controller, url, code, message) {
              setState(() {
                error = message;
              });
            },
          ),
          progress < 1.0
              ? Center(
                  child: CircularProgressIndicator(
                    value: progress,
                  ),
                )
              : const SizedBox.shrink(),
          error.isNotEmpty
              ? Center(
                  child: Text(error),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
