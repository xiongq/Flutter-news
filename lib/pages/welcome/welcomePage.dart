import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/router/router.gr.dart';
import 'package:news/common/values/colors.dart';
import 'package:news/common/utils/utils.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  /// 页头标题
  Widget _buildPageHeaderTitle() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(60)),
      child: Text(
        "Features",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: duSetFontSize(24),
        ),
      ),
    );
  }

  /// 页头描述
  Widget _buildPageHeaderDetail() {
    return Container(
      width: duSetWidth(242),
      height: duSetHeight(70),
      margin: EdgeInsets.only(top: duSetHeight(14)),
      child: Text(
        "The best of news channels all in one place. Trusted sources and personalized news for you.",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Avenir",
            fontWeight: FontWeight.normal,
            fontSize: duSetFontSize(16),
            height: 1.3),
      ),
    );
  }

  /// 特性说明
  Widget _buildFeatureItem() {
    return Column(
      children: <Widget>[
        FeatureItemsBuild(66, "feature-1",
            "Compelling photography and typography provide a beautiful reading"),
        FeatureItemsBuild(40, "feature-2",
            "Sector news never shares your personal data with advertisers or publishers"),
        FeatureItemsBuild(40, "feature-3",
            "You can get Premium to unlock hundreds of publications"),
      ],
    );
  }

  /// 开始按键
  Widget _buildStartButton() {
    return Container(
      width: duSetWidth(295),
      height: duSetHeight(44),
      // padding: EdgeInsets.only(bottom:10),
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: FlatButton(
        color: AppColors.primaryElement,
        textColor: AppColors.primaryElementText,
        child: Text("Get started"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(duSetWidth(6))),
        ),
        onPressed: () {
          // Navigator.pushNamed(
          //   context,
          //   "sign-in",
          // );
          ExtendedNavigator.of(context).pushNamed(Routes.signInPageRoute);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 375, height: 812, allowFontScaling: false);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              _buildPageHeaderTitle(),
              _buildPageHeaderDetail(),
              _buildFeatureItem(),
              Spacer(),
              _buildStartButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureItemsBuild extends StatelessWidget {
  final double marginTop;
  final String imageName;
  final String into;
  const FeatureItemsBuild(this.marginTop, this.imageName, this.into, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: duSetWidth(295),
      height: duSetHeight(80),
      margin: EdgeInsets.only(top: duSetHeight(marginTop)),
      child: Row(
        children: <Widget>[
          Container(
            width: duSetWidth(80),
            height: duSetHeight(80),
            child: Image.asset(
              "assets/images/$imageName.png",
              fit: BoxFit.none,
            ),
          ),
          Spacer(),
          Container(
            width: duSetWidth(195),
            child: Text(
              into,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: duSetFontSize(16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
