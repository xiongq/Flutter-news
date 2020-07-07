import 'package:flutter/material.dart';
import 'package:news/global.dart';
import 'package:news/pages/application/application.dart';
import 'package:news/pages/sign_in/sign_in.dart';
import 'package:news/pages/welcome/welcomePage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '';
class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 375,
      height: 812,
      allowFontScaling: false,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Global.isFirstOpen == true
          ? Welcome()
          : Global.isOfflineLogin == true
              ? ApplicationPage()
              : SignInPage(),
    );
  }
}
