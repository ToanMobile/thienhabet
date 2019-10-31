import 'package:thienhabet.ltd/utils/style.dart';
import 'package:thienhabet.ltd/widget/webview.dart';
import 'package:flutter/material.dart';

class HomeSupportScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeSupportState();
  }
}

class HomeSupportState extends State<HomeSupportScreen> {

  @override
  Widget build(BuildContext context) => WebviewKuApp(Config.linkHomeSupport, true);
}
