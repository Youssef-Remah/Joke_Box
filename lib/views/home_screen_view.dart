import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: ElevatedButton(
          onPressed: ()
          {
            // Add your onPressed code here!
          },

          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
            ),
          ),

          child: const Padding(
            padding: EdgeInsets.all(15.0),

            child: AutoSizeText(
              'Generate A Joke !',
              style: TextStyle(
                fontFamily: 'Copyduck',
                fontSize: 30.0,
              ),
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}
