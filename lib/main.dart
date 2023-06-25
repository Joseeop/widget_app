import 'package:flutter/material.dart';
import 'package:widget_app/config/theme/app_theme.dart';
import 'package:widget_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widget_app/presentation/screens/cards/cards_screens.dart';
import 'package:widget_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme:AppTheme(selectedColor: 0).getTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/buttons':(context) =>const  ButtosScreens(),
        '/cards':(context) =>const CardsScreen()
      },
    );
  }
}
