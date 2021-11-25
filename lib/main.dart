import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/pages/citizen_data_menu.dart';
import 'package:smartville/pages/dashboard_page.dart';
<<<<<<< HEAD
import 'package:smartville/pages/pelaporan_warga_page.dart';
import 'package:smartville/pages/permohonan_surat_pengantar_page.dart';
=======
import 'package:smartville/pages/edit_user_profile.dart';
import 'package:smartville/pages/forgot_password_page.dart';
>>>>>>> 0e36b1974a6cb113ad2decf365f2665f830c37a4
import 'package:smartville/pages/profile_page.dart';
import 'package:smartville/pages/register_page_2.dart';
import 'package:smartville/pages/register_page_3.dart';
import 'package:smartville/pages/request_support.dart';
import 'package:smartville/pages/wrapper_page.dart';
<<<<<<< HEAD
import 'package:smartville/pages/forgot_password_page.dart';
import 'package:smartville/provider/permohonan_surat_provider.dart';
import 'package:smartville/provider/user_provider.dart';
import 'package:smartville/provider/news_provider.dart';
import 'package:smartville/model/register_response.dart';
import 'package:smartville/model/notification_message.dart';
=======
import 'package:smartville/provider/news_provider.dart';
import 'package:smartville/provider/user_provider.dart';
>>>>>>> 0e36b1974a6cb113ad2decf365f2665f830c37a4

import 'model/register_data.dart';
import 'pages/login_page.dart';
import 'pages/register_page_1.dart';

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
        ChangeNotifierProvider(
          create: (_) => NewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PermohohonanSuratProvider(),
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
              final user = settings.arguments as RegisterData;
              return MaterialPageRoute(
                builder: (_) => RegisterPage2(
                  user: user,
                ),
              );
            case RegisterPage3.routeName:
              final user = settings.arguments as RegisterData;
              return MaterialPageRoute(
                builder: (_) => RegisterPage3(user: user),
                settings: settings,
              );
            case PermohohonanSuratPengantarPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const PermohohonanSuratPengantarPage(),
                settings: settings,
              );
            case PelaporanWargaPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const PelaporanWargaPage(),
                settings: settings,
              );
            case NotifikasiBerhasilPage.routeName:
              final notificationMessage =
                  settings.arguments as NotificationMessage;
              return MaterialPageRoute(
                builder: (_) => NotifikasiBerhasilPage(
                  notificationMessage: notificationMessage,
                ),
                settings: settings,
              );
            case CitizenDataMenu.routeName:
              return MaterialPageRoute(builder: (_) => const CitizenDataMenu());
            case DashboardPage.routeName:
              return MaterialPageRoute(builder: (_) => const DashboardPage());
            case ForgotPasswordPage.routeName:
              return MaterialPageRoute(
                  builder: (_) => const ForgotPasswordPage());
            case ProfilePage.routeName:
              return MaterialPageRoute(builder: (_) => const ProfilePage());

            case EditUserProfile.routeName:
              return MaterialPageRoute(builder: (_) => const EditUserProfile());

            case RequestSupport.routeName:
              return MaterialPageRoute(builder: (_) => const RequestSupport());
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
