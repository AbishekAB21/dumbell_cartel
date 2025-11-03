
// Model for Exercise API

class ExerciseModel {
  final String id;
  final String name;
  final String targetMuscle;
  final String gifUrl;
  final String videoUrl;
  final List<String> instructions;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.targetMuscle,
    required this.gifUrl,
    required this.videoUrl,
    required this.instructions,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      targetMuscle: json['target'] ?? '',
      gifUrl: json['gifUrl'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      instructions: List<String>.from(json['instructions'] ?? []),
    );
  }
}
