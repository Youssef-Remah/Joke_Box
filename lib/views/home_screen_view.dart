import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_box/view_models/preferences_view_model/cubit.dart';
import 'package:joke_box/view_models/preferences_view_model/states.dart';
import 'package:joke_box/views/display_joke_screen_view.dart';

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<PreferencesCubit, PreferencesStates>(

      listener: (BuildContext context, PreferencesStates state)
      {
        if(state is GetJokeSuccessState)
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => DisplayJokeScreen(
                jokeModel: PreferencesCubit.get(context).jokeModel!)
            ),
          );
        }
      },

      builder: (BuildContext context, PreferencesStates state)
      {
        PreferencesCubit cubit = PreferencesCubit.get(context);

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: ConditionalBuilder(
              condition: state is! GetJokeLoadingState,

              builder: (BuildContext context)
              {
                return ElevatedButton(
                  onPressed: ()
                  {
                    cubit.generateJoke();
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
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
                );
              },

              fallback: (BuildContext context) => const CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
