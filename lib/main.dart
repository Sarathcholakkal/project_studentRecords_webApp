import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_records/database/model/stundent_model.dart';
import 'package:student_records/services/locator/locator.dart';
import 'package:student_records/view/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //! material app same for web / what is material app actaual purpose rather than give a design style
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
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