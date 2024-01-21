import 'package:flutter/material.dart';
import 'package:wishlist_cart_bloc/screens/home/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontWeight:FontWeight.bold,fontSize: 22),
              backgroundColor: Color.fromARGB(255, 7, 255, 61))),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
