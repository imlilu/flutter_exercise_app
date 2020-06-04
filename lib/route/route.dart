import 'package:flutter/cupertino.dart';
import 'package:flutterexerciseapp/main.dart';

abstract class RouteConstants{

  static String homePage = "/home/main";

  static Map<String,WidgetBuilder> routeList = {
    homePage:(BuildContext context) => MyApp()
  };
}