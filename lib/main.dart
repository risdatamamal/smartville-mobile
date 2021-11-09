import 'package:flutter/material.dart';
import 'package:smartville/common/colors.dart';

import 'pages/login_page.dart';
import 'pages/register_page_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartVille',
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
            .copyWith(secondary: greyColor),
      ),
      home: const LoginPage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case LoginPage.routeName:
            return MaterialPageRoute(builder: (_) => const LoginPage());
          case RegisterPage1.routeName:
            return MaterialPageRoute(builder: (_) => const RegisterPage1());
          default:
            return MaterialPageRoute(
              builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              },
            );
        }
      },
    );
  }
}
