import 'package:thienhabet.ltd/utils/style.dart';
import 'package:thienhabet.ltd/widget/webview.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Config.screenHome = false;
    return Scaffold(
      body: WebviewKuApp(Config.linkHomeSupport, true),
    );
  }
}
