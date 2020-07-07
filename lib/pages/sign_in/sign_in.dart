import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/apis/apis.dart';
import 'package:news/common/entity/entity.dart';
import 'package:news/common/router/router.gr.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';
import 'package:news/common/widgets/widgets.dart';
import 'package:news/global.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var _emailTextController = new TextEditingController();
  var _passWordTextController = new TextEditingController();
  // 检查
  _checkInput() async {
    // if (!duIsEmail(_emailTextController.value.text)) {
    //   toastInfo(msg: "Email erro!");
    //   return;
    // }
    // if (!duCheckStringLength(_passWordTextController.value.text, 6)) {
    //   toastInfo(msg: "Password need  > 6!");
    //   return;
    // }
    UserLoginRequestEntity params = UserLoginRequestEntity(
      email: _emailTextController.value.text,
      password: duSHA256(_passWordTextController.value.text),
    );

    UserLoginReponseEntity res = await UserAPI.login(params: params, context: context);

    // 写本地 access_token , 不写全局，业务：离线登录
    // 全局数据 gUser
    Global.saveProfile(res);
    print(res.accessToken);
    // Navigator.pushNamed(context, "app");
    ExtendedNavigator.of(context).pushNamed(Routes.applicationPageRoute);
  }

  _handlePushSignUp() {
     ExtendedNavigator.of(context).pushNamed(Routes.signUpPageRoute);
  }

  // logo
  Widget _buildLogo() {
    return Container(
      // width: duSetWidth(110),
      margin: EdgeInsets.only(top: duSetHeight(40)),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: duSetWidth(76),
            width: duSetWidth(76),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    height: duSetWidth(76),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: [
                        Shadows.primaryShadow,
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(duSetWidth(38)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: duSetWidth(12),
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
          // Spacer(),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Text(
              "SECTOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: duSetFontSize(24),
                height: 1,
              ),
            ),
          ),
          Text(
            "news",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    
    return Container(
      width: duSetWidth(295),
      // height: 204,
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        children: [
          // email input
          inputTextEdit(
            controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            marginTop: 0,
            // autofocus: true,
          ),
          // password input
          inputTextEdit(
            controller: _passWordTextController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "Password",
            isPassword: true,
          ),

          // 注册、登录 横向布局
          Container(
            // height: duSetHeight(44),
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Row(
              children: [
                // 注册
                btnFlatButtonWidget(
                  onPressed: _handlePushSignUp,
                  gbColor: AppColors.thirdElement,
                  title: "Sign up",
                ),
                Spacer(),
                // 登录
                btnFlatButtonWidget(
                  onPressed: () => _checkInput(),
                  gbColor: AppColors.primaryElement,
                  title: "Sign in",
                ),
              ],
            ),
          ),
          // Spacer(),

          // Fogot password
          Container(
            height: duSetHeight(22),
            margin: EdgeInsets.only(top: duSetHeight(20)),
            child: FlatButton(
              onPressed: () => {},
              child: Text(
                "Fogot password?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(16),
                  height: 1, // 设置下行高，否则字体下沉
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 第三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      width: duSetWidth(295),
      //  margin: EdgeInsets.only(top: duSetHeight(40)),
      child: Column(
        children: <Widget>[
          Text("Or sign in with social networks"),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              btnFlatButtonBorderOnlyWidget(
                onPressed: () {},
                iconFileName: "icons-twitter",
              ),
              btnFlatButtonBorderOnlyWidget(
                onPressed: () {},
                iconFileName: "icons-google",
              ),
              btnFlatButtonBorderOnlyWidget(
                onPressed: () {},
                iconFileName: "icons-facebook",
              ),
            ],
          )
        ],
      ),
    );
  }

  // 注册按钮
  Widget _buildSignupButton() {
    return Container(
        width: duSetWidth(295),
        margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
        child: btnFlatButtonWidget(
            onPressed: _handlePushSignUp,
            title: "Sign up",
            width: duSetWidth(295),
            gbColor: AppColors.secondaryElement,
            fontColor: Colors.black,
          ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              _buildLogo(),
              _buildInputForm(),
              Spacer(),
              _buildThirdPartyLogin(),
              _buildSignupButton(),
            ],
          ),
        ),
      ),
    );
  }
}
