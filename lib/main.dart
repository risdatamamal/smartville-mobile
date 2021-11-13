import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/pages/citizen_data_menu.dart';
import 'package:smartville/pages/dashboard_page.dart';
import 'package:smartville/pages/register_page_2.dart';
import 'package:smartville/pages/register_page_3.dart';
import 'package:smartville/pages/wrapper_page.dart';
import 'package:smartville/provider/user_provider.dart';

import 'pages/login_page.dart';
import 'pages/register_page_1.dart';
import 'pages/notifikasi_berhasil_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'SmartVille',
        theme: ThemeData(
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
              .copyWith(secondary: greyColor),
        ),
        home: const WrapperPage(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case LoginPage.routeName:
              return MaterialPageRoute(builder: (_) => const LoginPage());
            case RegisterPage1.routeName:
              return MaterialPageRoute(builder: (_) => const RegisterPage1());
            case RegisterPage2.routeName:
              return MaterialPageRoute(builder: (_) => const RegisterPage2());
            case RegisterPage3.routeName:
              final name = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => RegisterPage3(name: name),
                settings: settings,
              );

            case CitizenDataMenu.routeName:
              return MaterialPageRoute(builder: (_) => const CitizenDataMenu());
            case DashboardPage.routeName:
              return MaterialPageRoute(builder: (_) => const DashboardPage());
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
      ),
    );
  }
}
