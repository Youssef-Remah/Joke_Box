import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:joke_box/views/main_screen_view.dart';

class SplashScreen extends StatefulWidget
{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState()
  {
    super.initState();

    Timer(
      const Duration(seconds: 1,),
      ()
      {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Column(
        children:
        [
          const Expanded(
            flex: 2,
            child: Image(image: AssetImage('lib/assets/images/splash_screen_bot.gif'))
          ),

          Expanded(
            child: AutoSizeText(
              'splash_screen'.tr(),
              style: const TextStyle(
                fontFamily: 'Copyduck',
                fontWeight: FontWeight.bold,
                fontSize: 60.0,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
