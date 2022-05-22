import 'package:flutter/material.dart';
import 'package:glassbalconyanalysis/ui/route/routing_constans.dart';
import 'package:glassbalconyanalysis/view/setting_page.dart';

import '../../view/home_page.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case SettingsPageRoute:
      return MaterialPageRoute(builder: (context) => SettingsPage());
      default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
