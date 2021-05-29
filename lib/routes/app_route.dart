import 'package:accoola/pages/home_page.dart';
import 'package:accoola/pages/login_page.dart';
import 'package:accoola/pages/members_page.dart';
import 'package:accoola/pages/stroge_page.dart';
import 'package:accoola/pages/sum_page.dart';
import 'package:accoola/pages/sum_page112.dart';
import 'package:accoola/pages/summary_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/members':
        return MaterialPageRoute(builder: (_) => MembersPage());
      case '/storage':
        return MaterialPageRoute(builder: (_) => StoragePage());
      case '/sum':
        return MaterialPageRoute(builder: (_) => SumPage112());
      case '/summary':
        return MaterialPageRoute(builder: (_) => SummaryPage());

      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
