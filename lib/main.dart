import 'package:flutter/material.dart';
import 'package:student_records/services/locator/locator.dart';
import 'package:student_records/services/locator/navigation_services.dart';
import 'package:student_records/services/route/route_function.dart';
import 'package:student_records/services/route/route_name.dart';
import 'package:student_records/theme/theme.dart';
import 'package:student_records/view/splash/splash_screen.dart';
import 'package:student_records/view/widget/layout_templates/layout_templates.dart';
import 'package:student_records/view/splash/themetest.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightMode,
          darkTheme: darkMode,
          themeMode: themeMode,
          // navigatorKey: locator<NavigationService>().navigatorKey,
          // onGenerateRoute: generateRoute,
          // initialRoute: splashRoute,
          home:
              //  LayoutTemplates()
              SplashScreen(),
        );
      },
    );
  }
}
