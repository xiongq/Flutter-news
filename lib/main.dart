import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/common/provider/provider.dart';
import 'package:news/common/router/router.gr.dart';
import 'package:news/global.dart';
import 'package:provider/provider.dart';

void main() => Global.init().then((e) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppState>.value(
            value: Global.appState,
          ),
        ],
        child: Consumer<AppState>(builder: (context, appState, _) {
          if (appState.isGrayFilter) {
            return ColorFiltered(
              child: MyApp(),
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.color),
            );
          } else {
            return MyApp();
          }
        }),
      ),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator<Router>(
        router: Router(),
        initialRoute: Routes.indexPageRoute,
      ),
      title: 'Flutter Demo',
      theme: ThemeData.fallback(),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
    );
  }
}
