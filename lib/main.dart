import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mail_tm/ui/pages/domain/view/domain_screen.dart';
import 'package:mail_tm/ui/pages/login/view/login_screen.dart';
import 'package:mail_tm/ui/pages/messages/view/message_screen.dart';
import 'package:mail_tm/ui/pages/register/view/register_screen.dart';
import 'package:mail_tm/ui/pages/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber[900],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(
          name: "/splash",
          page: () => const SplashScreen(),
          // binding: SplashBinding(),
        ),
        GetPage(
          name: '/login',
          page: () => const LoginScreen(),
          // binding: LoginBinding(),
        ),
        GetPage(
          name: "/domains", page: () => const DomainScreen(),
          // binding: DomainBinding(),
        ),
        GetPage(
          name: "/register", page: () => const RegisterScreen(),
          // binding: DomainBinding(),
        ),
        GetPage(
          name: "/message", page: () => const MessageScreen(),
          // binding: DomainBinding(),
        ),
      ],
      initialRoute: "/splash",
    );
  }
}
