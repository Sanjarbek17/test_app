import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../style/main_style.dart';
import './screens/main_screen.dart';
import './providers/main_screen_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: {
        '/': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => ProductProvider()),
                ChangeNotifierProvider(create: (_) => SwitcherProvider()),
                ChangeNotifierProvider(
                    create: (_) => BottomNavigationBarProvider()),
              ],
              child: const MainScreen(),
            ),
      },
    );
  }
}
