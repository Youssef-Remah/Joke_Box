import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_box/utils/reusable_components.dart';
import 'package:joke_box/view_models/preferences_view_model/cubit.dart';
import 'package:joke_box/view_models/preferences_view_model/states.dart';

class PreferencesScreen extends StatelessWidget
{
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<PreferencesCubit, PreferencesStates>(

      listener: (BuildContext context, PreferencesStates state)
      {

      },

      builder: (BuildContext context, PreferencesStates state)
      {
        PreferencesCubit cubit = PreferencesCubit.get(context);

        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children:
            [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                [
                  const Text(
                    'Language',
                    style: TextStyle(
                      fontFamily: 'SeasonPrime',
                      fontSize: 28.0,
                    ),
                  ),

                  buildDropDownList(
                    items: ['en - English', 'cs - Czech', 'de - German', 'es - Spanish', 'fr - French', 'pt - Portuguese'],

                    selectedItem: cubit.language,

                    changeDropDownValue: (String newValue)
                    {
                      cubit.changeLanguageDropDown(newLanguage: newValue);
                    },
                  ),
                ],
              ),

              const SizedBox(
                height: 70.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                [
                  const Text(
                    'Category',
                    style: TextStyle(
                      fontFamily: 'SeasonPrime',
                      fontSize: 28.0,
                    ),
                  ),

                  buildDropDownList(
                    items: ['Programming', 'Dark', 'Spooky', 'Christmas'],

                    selectedItem: cubit.category,

                    changeDropDownValue: (String newValue)
                    {
                      cubit.changeCategoryDropDown(newCategory: newValue);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
