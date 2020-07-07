import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/common/provider/provider.dart';
import 'package:news/common/router/router.gr.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';
import 'package:news/common/widgets/widgets.dart';
import 'package:news/global.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Widget _buildUserinfo() {
    return Container(
      width: duSetWidth(375),
      height: duSetWidth(332),
      child: Column(
        children: <Widget>[
          Container(
            height: duSetHeight(108),
            width: duSetHeight(108),
            margin: EdgeInsets.only(top: duSetHeight(40)),
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      "http://img.duoziwang.com/2017/08/082981299933.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              shape: BoxShape.circle,
              boxShadow: [
                Shadows.primaryShadow,
              ],
            ),
          ),
          SizedBox(height: duSetHeight(30)),
          Text(
            "xiongq",
            style: TextStyle(
              color: AppColors.thirdElement,
              fontFamily: 'Montserrat',
              fontSize: duSetFontSize(24.0),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: duSetHeight(10)),
          Text(
            "@bear",
            style: TextStyle(
              color: AppColors.thirdElement,
              fontFamily: 'Avenir',
              fontSize: duSetFontSize(16.0),
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: duSetHeight(24)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: btnFlatButtonWidget(
              onPressed: () {},
              width: duSetWidth(335),
              height: duSetWidth(44),
              fontWeight: FontWeight.w600,
              title: "Get Premium - \$9.99",
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    // final appState = Provider.of<AppState>(context);

    // return Container(
    //   child: Center(
    //     child: Column(
    //       children: <Widget>[
    //         Text('userName: ${Global.profile.displayName}'),
    //         Divider(),
    //         RaisedButton(
    //           child: Text("灰色切换 ${appState.isGrayFilter}"),
    //           onPressed: () {
    //             appState.switchGrayFilter();
    //             // _eachItem();
    //           },
    //         ),
    //         RaisedButton(
    //           child: Text("注销登录"),
    //           onPressed: () {
    //             // goLoginPage(context);
    //             ExtendedNavigator.rootNavigator
    //                 .pushNamed(Routes.signInPageRoute);
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildUserinfo(),
              Divider(
                height: 1,
              ),
              Divider(
                height: 10,
                thickness: 10.0,
                color: Color.fromARGB(255, 240, 240, 240),
              ),
              ListTile(
                title: Text(
                  "Email",
                  style: TextStyle(
                    color: AppColors.thirdElement,
                    fontFamily: 'Montserrat',
                    fontSize: duSetFontSize(18.0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Text(
                  "flyxiongq@gmail.com",
                  style: TextStyle(
                    color: AppColors.thirdElement,
                    fontFamily: 'Avenir',
                    fontSize: duSetFontSize(18.0),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Divider(
                height: 1,
              ),
              Divider(
                height: 10,
                thickness: 10.0,
                color: Color.fromARGB(255, 240, 240, 240),
              ),
              ListTile(
                title: Text(
                  "Favorite channels",
                  style: TextStyle(
                    color: AppColors.thirdElement,
                    fontFamily: 'Montserrat',
                    fontSize: duSetFontSize(18.0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Container(
                  width: 140,
                  // color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "17",
                        style: TextStyle(
                          color: AppColors.thirdElement,
                          fontFamily: 'Avenir',
                          fontSize: duSetFontSize(18.0),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(width: duSetWidth(20)),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.thirdElement,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 1),
              ListTile(
                title: Text(
                  "Bookmarks",
                  style: TextStyle(
                    color: AppColors.thirdElement,
                    fontFamily: 'Montserrat',
                    fontSize: duSetFontSize(18.0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Container(
                  width: 140,
                  // color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "294",
                        style: TextStyle(
                          color: AppColors.thirdElement,
                          fontFamily: 'Avenir',
                          fontSize: duSetFontSize(18.0),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(width: duSetWidth(20)),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.thirdElement,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 1),
              ListTile(
                title: Text(
                  "Popular categories",
                  style: TextStyle(
                    color: AppColors.thirdElement,
                    fontFamily: 'Montserrat',
                    fontSize: duSetFontSize(18.0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Container(
                  width: 140,
                  // color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "7",
                        style: TextStyle(
                          color: AppColors.thirdElement,
                          fontFamily: 'Avenir',
                          fontSize: duSetFontSize(18.0),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(width: duSetWidth(20)),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.thirdElement,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 1),
              Divider(
                height: 10,
                thickness: 10.0,
                color: Color.fromARGB(255, 240, 240, 240),
              ),
              ListTile(
                title: Text(
                  "Newsletter",
                  style: TextStyle(
                    color: AppColors.thirdElement,
                    fontFamily: 'Montserrat',
                    fontSize: duSetFontSize(18.0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.thirdElement,
                ),
              ),
              Divider(height: 1),
              ListTile(
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: AppColors.thirdElement,
                    fontFamily: 'Montserrat',
                    fontSize: duSetFontSize(18.0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.thirdElement,
                ),
              ),
              Divider(height: 1),
              Divider(
                height: 10,
                thickness: 10.0,
                color: Color.fromARGB(255, 240, 240, 240),
              ),
              ListTile(
                title: Text(
                  "Log out",
                  style: TextStyle(
                    color: AppColors.thirdElement,
                    fontFamily: 'Montserrat',
                    fontSize: duSetFontSize(18.0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  ExtendedNavigator.rootNavigator
                      .pushNamed(Routes.signInPageRoute);
                },
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.thirdElement,
                ),
              ),
              Divider(height: 1),
              Divider(
                height: 10,
                thickness: 10.0,
                color: Color.fromARGB(255, 240, 240, 240),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
