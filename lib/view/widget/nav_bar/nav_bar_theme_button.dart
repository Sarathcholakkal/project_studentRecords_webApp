// import 'package:flutter/material.dart';

// ValueNotifier<ThemeMode> themeNotifier =
//     ValueNotifier<ThemeMode>(ThemeMode.light);

// class NavBarThemeButton extends StatelessWidget {
//   const NavBarThemeButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<ThemeMode>(
//       valueListenable: themeNotifier,
//       builder: (BuildContext ctx, newTheme, _) {
//         return IconButton(
//           onPressed: () {
//             themeNotifier.value = themeNotifier.value == ThemeMode.light
//                 ? ThemeMode.dark
//                 : ThemeMode.light;
//           },
//           icon: newTheme == ThemeMode.light
//               ? const Icon(
//                   Icons.dark_mode,
//                   size: 25,
//                 )
//               : const Icon(
//                   Icons.light_mode,
//                   size: 25,
//                 ),
//         );
//       },
//     );
//   }
// }
