import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:joke_box/models/joke_model.dart';

class DisplayJokeScreen extends StatefulWidget
{
  const DisplayJokeScreen
  ({
    super.key,
    required this.jokeModel,
  });

  final JokeModel jokeModel;

  @override
  State<DisplayJokeScreen> createState() => _DisplayJokeScreenState();
}

class _DisplayJokeScreenState extends State<DisplayJokeScreen>
{

  bool isJokeDeliveryDisplayed = false;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        actions:
        [
          IconButton(
            onPressed: ()
            {
              //TODO: Consume the favorite jokes cubit and save the joke
            },
            icon: Icon(Ionicons.bookmark_outline),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children:
          [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Image(image: AssetImage('lib/assets/images/${widget.jokeModel.category}.png')),

                const SizedBox(
                  width: 15.0,
                ),

                Text(
                  '${widget.jokeModel.category}',
                  style: const TextStyle(
                    fontFamily: 'SquashyFlow',
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 170.0,
            ),

            AutoSizeText(
              '${widget.jokeModel.setup}',
              style: const TextStyle(
                fontFamily: 'SeasonPrime',
              ),
              minFontSize: 25.0,
              maxLines: 3,
            ),

            const SizedBox(
              height: 100.0,
            ),

            ConditionalBuilder(
              condition: isJokeDeliveryDisplayed,

              builder: (BuildContext context) => AutoSizeText(
                '${widget.jokeModel.delivery}',
                style: const TextStyle(
                  fontFamily: 'SeasonPrime',
                ),
                minFontSize: 25.0,
                maxLines: 3,
              ),

              fallback: (BuildContext context) => InkWell(
                child: const Image(image: AssetImage('lib/assets/images/light-bulb.png')),
                onTap: ()
                {
                  setState(()
                  {
                    isJokeDeliveryDisplayed = true;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
