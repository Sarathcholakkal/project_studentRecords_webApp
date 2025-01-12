import 'package:flutter/material.dart';
import 'package:student_records/services/locator/locator.dart';
import 'package:student_records/view/splash/splash_screen.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //! material app same for web / what is material app actaual purpose rather than give a design style
      debugShowCheckedModeBanner: false,
      home:
          //  LayoutTemplates()
          SplashScreen(),
    );
  }
}






//================
//todo need to set theme for web
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<ThemeMode>(
//       valueListenable: themeNotifier,
//       builder: (context, themeMode, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: lightMode,
//           darkTheme: darkMode,
//           themeMode: themeMode,
//           // navigatorKey: locator<NavigationService>().navigatorKey,
//           // onGenerateRoute: generateRoute,
//           // initialRoute: splashRoute,
//           home:
//               //  LayoutTemplates()
//               SplashScreen(),
//         );
//       },
//     );
//   }
// }