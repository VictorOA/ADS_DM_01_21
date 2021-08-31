import 'package:aplicacaoteste/appcontroller.dart';
import 'package:aplicacaoteste/login_page.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (BuildContext context, child) {
        return MaterialApp(
          theme: ThemeData(
              primaryColor: Colors.blue,
              brightness: AppController.instance.isDark
                  ? Brightness.dark
                  : Brightness.light),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/home': (context) => HomePage(),
          },
        );
      },
    );
  }
}
