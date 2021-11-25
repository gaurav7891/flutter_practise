import 'package:day_1/core/store.dart';
import 'package:day_1/pages/cart_page.dart';
import 'package:day_1/pages/home_detail_page.dart';
import 'package:day_1/pages/login_page.dart';
import 'package:day_1/utils/routes.dart';
import 'package:day_1/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  doSomething({@required bool y = false, int x = 100}) {}
  @override
  Widget build(BuildContext context) {
    doSomething();
    return MaterialApp.router(
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        "/": (_, __) => MaterialPage(child: LoginPage()),
        MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
        MyRoutes.homeDetailsRoute: (uri, params) {
          final catalog = (VxState.store as MyStore)
              .catalogModel
              .getById(int.parse(uri.queryParameters["id"]!));
          return MaterialPage(
              child: HomeDetailPage(
            catalog: params,
          ));
        },
        MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginPage()),
        MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartPage()),
      }),
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      themeMode: ThemeMode.system,
      // initialRoute: "/home",
      // routes: {
      //   "/": (context) => LoginPage(),
      //   MyRoutes.homeRoute: (context) => HomePage(),
      //   MyRoutes.loginRoute: (context) => LoginPage(),
      //   MyRoutes.cartRoute: (context) => CartPage(),
    );
  }
}
