import 'package:flutter/material.dart';
import "package:expense_tracker/widgets/expenses.dart";
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
  //   _,
  // ) {
  // });
}

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Expenses(),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(colorScheme: kDarkColorScheme),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
