import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:news/pages/application/application.dart';
import 'package:news/pages/bookmarks/bookmarkPage.dart';
import 'package:news/pages/category/categoryPage.dart';
import 'package:news/pages/channel/channelPage.dart';
import 'package:news/pages/detailsPage/detailsPage.dart';
import 'package:news/pages/index/indexPage.dart';
import 'package:news/pages/searchPage/searchPage.dart';
import 'package:news/pages/sign_in/sign_in.dart';
import 'package:news/pages/sign_up/sign_up.dart';
import 'package:news/pages/welcome/welcomePage.dart';

Widget zoomInTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // you get an animation object and a widget
  // make your own transition

  return FadeTransition(
    opacity: animation,
    child: child,
  );
}

@MaterialAutoRouter()
class $Router {
  @initial
  IndexPage indexPageRoute;

  Welcome welcomePageRoute;

  SignInPage signInPageRoute;

  SignUpPage signUpPageRoute;

  ApplicationPage applicationPageRoute;

  @CustomRoute(transitionsBuilder: zoomInTransition)
  DetailsPage detailsPageRoute;

  @CustomRoute(transitionsBuilder: zoomInTransition)
  ChannelPage channelPageRoute;

  SearchPage searchPageRoute;

  CategoryPage categoryPageRoute;
  BookMarkPage bookMarkPageRoute;
}
