import 'package:flash_cards_portrait_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flash cards',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xff333333),
        backgroundColor: Colors.white,
        shadowColor: const Color(0xff333333),
        cardColor: Colors.white,
      ),
      home: MainScreen(),
    );
  }
}
