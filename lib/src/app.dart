import 'package:drinkdeck/src/features/create/create_page.dart';
import 'package:drinkdeck/src/features/home/home_page.dart';
import 'package:drinkdeck/src/shared/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DrinkDeck',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/create': (context) => const CreatePage(),
      },
    );
  }
}
