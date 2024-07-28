import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_box/services/dio_helper.dart';
import 'package:joke_box/utils/bloc_observer.dart';
import 'package:joke_box/view_models/preferences_view_model/cubit.dart';
import 'package:joke_box/views/splash_screen_view.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  DioHelper.jokeInitializeApi();

  runApp(
    EasyLocalization(
      supportedLocales: const
      [
        Locale('en'),
        Locale('fr'),
        Locale('de'),
        Locale('cs'),
        Locale('es'),
        Locale('pt'),
      ],

      path: 'lib/assets/translations',

      fallbackLocale: const Locale('en'),

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (BuildContext context) => PreferencesCubit()),
      ],

      child: MaterialApp(

        localizationsDelegates: context.localizationDelegates,

        supportedLocales: context.supportedLocales,

        locale: context.locale,

        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          useMaterial3: false,

          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'SquashyFlow',
            ),
          ),

          scaffoldBackgroundColor: Colors.white,
        ),

        home: const SplashScreen(),
      ),
    );
  }
}
