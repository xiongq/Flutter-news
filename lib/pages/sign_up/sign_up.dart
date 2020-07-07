import 'package:flutter/material.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';
import 'package:news/common/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _emailTextController = new TextEditingController();
  var _passWordTextController = new TextEditingController();
  var _fullNameTextController = new TextEditingController();

  ///logo
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(60)),
      child: Text(
        "Sign up",
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

  ///表单
  Widget _buildSignupText() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: 49),
      child: Column(
        children: <Widget>[
          inputTextEdit(
            controller: _fullNameTextController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Full name",
            isPassword: false,
            marginTop: 0,
          ),
          inputTextEdit(
            controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            isPassword: false,
            marginTop: 15,
          ),
          inputTextEdit(
            controller: _passWordTextController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "Password",
            isPassword: true,
            marginTop: 15,
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 15, 0, 20),
              child: btnFlatButtonWidget(
                onPressed: () {},
                title: "Create an account",
                width: duSetWidth(295),
                gbColor: AppColors.primaryElement,
                fontColor: Colors.white70,
              )),
          SizedBox(height: 12),

          // Spacer(),
        ],
      ),
    );
  }

  ///第三方
  Widget _buildThirdLogin() {
    return Container(
      width: duSetWidth(295),
      // color: Colors.yellow,
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

  ///accountButton
  Widget _buildAccountButton() {
    return Container(
      
        margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
        child: btnFlatButtonWidget(
          onPressed: () {
            Navigator.pop(context);
          },
          title: "I have an account",
          width: duSetWidth(295),
          gbColor: AppColors.secondaryElement,
          fontColor: AppColors.primaryText,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(
        context: context,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.info,
                color: Colors.black,
              ),
              onPressed: () {
                toastInfo(msg: "App info");
              })
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: duSetWidth(295),
            child: Column(
              children: <Widget>[
                _buildLogo(),
                _buildSignupText(),
                Spacer(),
                _buildThirdLogin(),
                _buildAccountButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
