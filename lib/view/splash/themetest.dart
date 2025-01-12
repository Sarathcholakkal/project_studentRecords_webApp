// import 'package:flutter/material.dart';

// ValueNotifier<ThemeMode> themeNotifier =
//     ValueNotifier<ThemeMode>(ThemeMode.light);

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       actions: [
//         ValueListenableBuilder<ThemeMode>(
//             valueListenable: themeNotifier,
//             builder: (BuildContext ctx, newTheme, _) {
//               return IconButton(
//                   onPressed: () {
//                     themeNotifier.value = themeNotifier.value == ThemeMode.light
//                         ? ThemeMode.dark
//                         : ThemeMode.light;
//                   },
//                   icon: newTheme == ThemeMode.light
//                       ? const Icon(
//                           Icons.dark_mode,
//                           size: 25,
//                         )
//                       : const Icon(
//                           Icons.light_mode,
//                           size: 25,
//                         ));
//             }),
//         const SizedBox(
//           width: 10,
//         )
//       ],
//     );
//   }

//   // This is required to properly define the size of the AppBar
//   @override
//   Size get preferredSize => const Size.fromHeight(42);
// }
