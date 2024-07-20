import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_box/models/joke_model.dart';
import 'package:joke_box/services/dio_helper.dart';
import 'package:joke_box/view_models/preferences_view_model/states.dart';

class PreferencesCubit extends Cubit<PreferencesStates>
{

  PreferencesCubit() : super(PreferencesInitialState());

  static PreferencesCubit get(context) => BlocProvider.of(context);

  //Fields

  JokeModel? jokeModel;

  String language = 'en - English';

  String category = 'Programming';


  //Methods for UI State Management

  void changeLanguageDropDown({required String newLanguage})
  {
    language = newLanguage;

    emit(ChangeLanguageDropDownState());
  }

  void changeCategoryDropDown({required String newCategory})
  {
    category = newCategory;

    emit(ChangeCategoryDropDownState());
  }


  //Methods for App Logic

  void generateJoke()
  {
    emit(GetJokeLoadingState());

    DioHelper.getJoke(
      url: 'joke/$category',
      params:
      {
        'lang':language.substring(0, 2),
        'type':'twopart',
      },
    )
    .then((value)
    {
      jokeModel = JokeModel.fromJson(value.data as Map<String, dynamic>);

      emit(GetJokeSuccessState());
    })
    .catchError((error)
    {
      emit(GetJokeErrorState());

      if (kDebugMode)
      {
        //TODO: Remove Print Invocations
        print(error.toString());
      }

    });
  }

}