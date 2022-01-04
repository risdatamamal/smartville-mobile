import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'common/colors.dart';

import 'pages/change_new_password_page.dart';
import 'pages/change_forgot_password_page.dart';
import 'pages/citizen_data_menu_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/otp_page.dart';
import 'pages/pelaporan_warga_page.dart';
import 'pages/pendataan_domisili_page.dart';
import 'pages/pendataan_kelahiran_page.dart';
import 'pages/pendataan_kematian_page.dart';
import 'pages/permohonan_surat_pengantar_page.dart';
import 'pages/profile_edit_page.dart';
import 'pages/forgot_password_page.dart';
import 'pages/profile_page.dart';
import 'pages/register_page_one.dart';
import 'pages/register_page_two.dart';
import 'pages/register_page_three.dart';
import 'pages/request_support_page.dart';
import 'pages/syarat_ketentuan.dart';
import 'pages/wrapper_page.dart';
import 'pages/notifikasi_berhasil_page.dart';
import 'pages/history_page.dart';
import 'pages/login_page.dart';

import 'provider/forgot_password_provider.dart';
import 'provider/history_provider.dart';
import 'provider/pelaporan_warga_provider.dart';
import 'provider/pendataan_domisili_provider.dart';
import 'provider/pendataan_kelahiran_provider.dart';
import 'provider/pendataan_kematian_provider.dart';
import 'provider/permohonan_surat_provider.dart';
import 'provider/request_support_provider.dart';
import 'provider/user_provider.dart';
import 'provider/news_provider.dart';

import 'model/notification_message.dart';
import 'model/register_data.dart';

import 'utils/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

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
        ChangeNotifierProvider(
          create: (_) => PendataanKelahiranProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PendataanDomisiliProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PendataanKematianProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RequestSupportProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HistoryProvider(),
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
            case SyaratKetentuan.routeName:
              return MaterialPageRoute(builder: (_) => const SyaratKetentuan());
            case RequestSupportPage.routeName:
              return MaterialPageRoute(
                  builder: (_) => const RequestSupportPage());
            case HistoryPage.routeName:
              return MaterialPageRoute(builder: (_) => const HistoryPage());
            case OtpPage.routeName:
              final emailConfirmation = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => OtpPage(
                  emailConfirmation: emailConfirmation,
                ),
              );
            case ChangeNewPasswordPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const ChangeNewPasswordPage(),
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
