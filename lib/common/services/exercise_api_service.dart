import 'package:dio/dio.dart';
import 'package:dumbell_cartel/common/models/exercise_model.dart';

class ExerciseApiService {
  final Dio _dio = Dio();

  final String baseURL = 'https://exercisedb.p.rapidapi.com/exercises';
  final String apiKey ='Add a key';

  // Search Exercises
  Future<List<ExerciseModel>> searchExercises(String query) async {
    try {
      final response = await _dio.get(
       'https://exercisedb.p.rapidapi.com/exercises/name/$query',
        options: Options(
          headers: {
            'X-RapidAPI-Key': apiKey,
            'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as List;
       
        return data.map((e) => ExerciseModel.fromJson(e)).toList();
        
      } else {
        throw Exception('Unable to fetch exercises');
      }
    } catch (e) {
      throw Exception('Unable to fetch exercises');
    }
  }
}
