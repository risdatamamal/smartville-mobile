import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/pages/change_password_forgot_page.dart';
import 'package:smartville/pages/citizen_data_menu.dart';
import 'package:smartville/pages/dashboard_page.dart';
import 'package:smartville/pages/otp_page.dart';
import 'package:smartville/pages/pelaporan_warga_page.dart';
import 'package:smartville/pages/pendataan_domisili_page.dart';
import 'package:smartville/pages/pendataan_kelahiran_page.dart';
import 'package:smartville/pages/pendataan_kematian_page.dart';
import 'package:smartville/pages/permohonan_surat_pengantar_page.dart';
import 'package:smartville/pages/edit_user_profile.dart';
import 'package:smartville/pages/forgot_password_page.dart';

import 'package:smartville/pages/profile_page.dart';
import 'package:smartville/pages/register_page_2.dart';
import 'package:smartville/pages/register_page_3.dart';
import 'package:smartville/pages/request_support.dart';
import 'package:smartville/pages/wrapper_page.dart';
import 'package:smartville/pages/notifikasi_berhasil_page.dart';
import 'package:smartville/provider/forgot_password_provider.dart';
import 'package:smartville/provider/pelaporan_warga_provider.dart';
import 'package:smartville/provider/permohonan_surat_provider.dart';
import 'package:smartville/provider/user_provider.dart';
import 'package:smartville/provider/news_provider.dart';
import 'package:smartville/model/notification_message.dart';

import 'model/register_data.dart';
import 'pages/history_page.dart';
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
        ChangeNotifierProvider(
          create: (_) => PelaporanWargaProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ForgotPasswordProvider(),
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
            case PendataanKelahiranPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const PendataanKelahiranPage(),
                settings: settings,
              );
            case PendataanKematianPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const PendataanKematianPage(),
                settings: settings,
              );
            case PendataanDomisiliPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const PendataanDomisiliPage(),
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

            case HistoryPage.routeName:
              return MaterialPageRoute(builder: (_) => const HistoryPage());

            case OtpPage.routeName:
              final emailConfirmation = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => OtpPage(
                  emailConfirmation: emailConfirmation,
                ),
              );

            case ChangePasswordForgotPage.routeName:
              final email = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => ChangePasswordForgotPage(email: email),
              );

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
