import 'package:thienhabet.ltd/utils/style.dart';
import 'package:thienhabet.ltd/widget/webview.dart';
import 'package:flutter/material.dart';

class HomeLinkScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeLinkState();
  }
}

class HomeLinkState extends State<HomeLinkScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 30),
      child: WebviewKuApp(Config.linkHome, true),
    );
  }
}
