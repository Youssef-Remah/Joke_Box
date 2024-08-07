import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_box/models/joke_model.dart';
import 'package:joke_box/view_models/saved_jokes_view_model/states.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

class SavedJokesCubit extends Cubit<SavedJokesStates>
{

  SavedJokesCubit() : super(SavedJokesInitialState());

  static SavedJokesCubit get(context) => BlocProvider.of(context);


  //Methods for Database Operations

  Future<void> saveJokeToDatabase({
    required JokeModel jokeModel,
  }) async
  {
    emit(SaveJokeToDatabaseLoadingState());

    // Get the database path
    var databasesPath = await getDatabasesPath();

    String path = join(databasesPath, 'saved_jokes.db');

    // Open the database and create the table if it doesn't exist
    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async
      {
        // Create the FavoriteJokes table
        await db.execute
        (
          'CREATE TABLE FavoriteJokes (id TEXT PRIMARY KEY, category TEXT, setup TEXT, delivery TEXT)',
        );
      },
    );

    // Insert the joke into the database
    try
    {
      var uuid = Uuid();

      int id = await db.insert(
        'FavoriteJokes',
        {
          'id': uuid.v1(),
          'category': jokeModel.category,
          'setup': jokeModel.setup,
          'delivery': jokeModel.delivery,
        },
      );

      // Check if the insertion was successful
      if (id != 0)
      {
        emit(SaveJokeToDatabaseSuccessState());
      }

      else
      {
        print('Cannot insert record!');

        emit(SaveJokeToDatabaseErrorState());
      }
    }

    catch (e)
    {
      print(e.toString());

      emit(SaveJokeToDatabaseErrorState());
    }

    finally
    {
      // Close the database
      await db.close();
    }
  }

  // Future<void> getJokeFromDatabase()
  // async
  // {
  //
  //
  // }

}