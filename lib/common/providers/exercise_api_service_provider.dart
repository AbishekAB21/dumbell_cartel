import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/exercise_model.dart';
import '../services/exercise_api_service.dart';

// Provide API instance
final exerciseApiProvider = Provider((ref) => ExerciseApiService());

// State for search query
final searchQueryProvider = StateProvider<String>((ref) => '');

// Async fetch for search results
final searchWorkoutProvider = FutureProvider.autoDispose<List<ExerciseModel>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  final api = ref.watch(exerciseApiProvider);

  if (query.isEmpty) return [];
  return api.searchExercises(query);
});

// State for selected workouts
final selectedWorkoutsProvider = StateProvider<List<ExerciseModel>>((ref) => []);
