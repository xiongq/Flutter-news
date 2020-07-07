// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:news/pages/index/indexPage.dart';
import 'package:news/pages/welcome/welcomePage.dart';
import 'package:news/pages/sign_in/sign_in.dart';
import 'package:news/pages/sign_up/sign_up.dart';
import 'package:news/pages/application/application.dart';
import 'package:news/pages/detailsPage/detailsPage.dart';
import 'package:news/common/router/router.dart';
import 'package:news/common/entity/news.dart';
import 'package:news/pages/channel/channelPage.dart';
import 'package:news/common/entity/channels.dart';
import 'package:news/pages/searchPage/searchPage.dart';
import 'package:news/pages/category/categoryPage.dart';
import 'package:news/pages/bookmarks/bookmarkPage.dart';

abstract class Routes {
  static const indexPageRoute = '/';
  static const welcomePageRoute = '/welcome-page-route';
  static const signInPageRoute = '/sign-in-page-route';
  static const signUpPageRoute = '/sign-up-page-route';
  static const applicationPageRoute = '/application-page-route';
  static const detailsPageRoute = '/details-page-route';
  static const channelPageRoute = '/channel-page-route';
  static const searchPageRoute = '/search-page-route';
  static const categoryPageRoute = '/category-page-route';
  static const bookMarkPageRoute = '/book-mark-page-route';
  static const all = {
    indexPageRoute,
    welcomePageRoute,
    signInPageRoute,
    signUpPageRoute,
    applicationPageRoute,
    detailsPageRoute,
    channelPageRoute,
    searchPageRoute,
    categoryPageRoute,
    bookMarkPageRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.indexPageRoute:
        if (hasInvalidArgs<IndexPageArguments>(args)) {
          return misTypedArgsRoute<IndexPageArguments>(args);
        }
        final typedArgs = args as IndexPageArguments ?? IndexPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => IndexPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.welcomePageRoute:
        if (hasInvalidArgs<WelcomeArguments>(args)) {
          return misTypedArgsRoute<WelcomeArguments>(args);
        }
        final typedArgs = args as WelcomeArguments ?? WelcomeArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => Welcome(key: typedArgs.key),
          settings: settings,
        );
      case Routes.signInPageRoute:
        if (hasInvalidArgs<SignInPageArguments>(args)) {
          return misTypedArgsRoute<SignInPageArguments>(args);
        }
        final typedArgs = args as SignInPageArguments ?? SignInPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignInPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.signUpPageRoute:
        if (hasInvalidArgs<SignUpPageArguments>(args)) {
          return misTypedArgsRoute<SignUpPageArguments>(args);
        }
        final typedArgs = args as SignUpPageArguments ?? SignUpPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignUpPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.applicationPageRoute:
        if (hasInvalidArgs<ApplicationPageArguments>(args)) {
          return misTypedArgsRoute<ApplicationPageArguments>(args);
        }
        final typedArgs =
            args as ApplicationPageArguments ?? ApplicationPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => ApplicationPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.detailsPageRoute:
        if (hasInvalidArgs<DetailsPageArguments>(args)) {
          return misTypedArgsRoute<DetailsPageArguments>(args);
        }
        final typedArgs =
            args as DetailsPageArguments ?? DetailsPageArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              DetailsPage(key: typedArgs.key, newsItem: typedArgs.newsItem),
          settings: settings,
          transitionsBuilder: zoomInTransition,
        );
      case Routes.channelPageRoute:
        if (hasInvalidArgs<ChannelPageArguments>(args)) {
          return misTypedArgsRoute<ChannelPageArguments>(args);
        }
        final typedArgs =
            args as ChannelPageArguments ?? ChannelPageArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ChannelPage(key: typedArgs.key, entity: typedArgs.entity),
          settings: settings,
          transitionsBuilder: zoomInTransition,
        );
      case Routes.searchPageRoute:
        if (hasInvalidArgs<SearchPageArguments>(args)) {
          return misTypedArgsRoute<SearchPageArguments>(args);
        }
        final typedArgs = args as SearchPageArguments ?? SearchPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SearchPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.categoryPageRoute:
        if (hasInvalidArgs<CategoryPageArguments>(args)) {
          return misTypedArgsRoute<CategoryPageArguments>(args);
        }
        final typedArgs =
            args as CategoryPageArguments ?? CategoryPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => CategoryPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.bookMarkPageRoute:
        if (hasInvalidArgs<BookMarkPageArguments>(args)) {
          return misTypedArgsRoute<BookMarkPageArguments>(args);
        }
        final typedArgs =
            args as BookMarkPageArguments ?? BookMarkPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => BookMarkPage(key: typedArgs.key),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//IndexPage arguments holder class
class IndexPageArguments {
  final Key key;
  IndexPageArguments({this.key});
}

//Welcome arguments holder class
class WelcomeArguments {
  final Key key;
  WelcomeArguments({this.key});
}

//SignInPage arguments holder class
class SignInPageArguments {
  final Key key;
  SignInPageArguments({this.key});
}

//SignUpPage arguments holder class
class SignUpPageArguments {
  final Key key;
  SignUpPageArguments({this.key});
}

//ApplicationPage arguments holder class
class ApplicationPageArguments {
  final Key key;
  ApplicationPageArguments({this.key});
}

//DetailsPage arguments holder class
class DetailsPageArguments {
  final Key key;
  final NewsRecommendResponseEntity newsItem;
  DetailsPageArguments({this.key, this.newsItem});
}

//ChannelPage arguments holder class
class ChannelPageArguments {
  final Key key;
  final ChannelResponseEntity entity;
  ChannelPageArguments({this.key, this.entity});
}

//SearchPage arguments holder class
class SearchPageArguments {
  final Key key;
  SearchPageArguments({this.key});
}

//CategoryPage arguments holder class
class CategoryPageArguments {
  final Key key;
  CategoryPageArguments({this.key});
}

//BookMarkPage arguments holder class
class BookMarkPageArguments {
  final Key key;
  BookMarkPageArguments({this.key});
}
