import 'package:flutter/material.dart';
import 'package:joke_box/views/splash_screen_view.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'SquashyFlow',
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
      ),
      home: const SplashScreen(),
    );
  }
}
