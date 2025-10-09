import 'package:dio/dio.dart';

class AiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://generativelanguage.googleapis.com/v1beta",
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  // Send message to AI
  Future<String> sendMessage({
    required String modelName,
    required String message,
  }) async {
    try {
      final prompt =
          """
You are an expert AI assistant specialized in health, fitness, gym workouts, and nutrition. 
Answer only questions related to these topics and normal greeting like Hey, Hi, Bye. Sound  encouragive, 
If the question is outside these topics, reply with: "Apologies, I can only answer questions about health, fitness, gym, and nutrition.
When you respond to a greeting message always mention your name as SpotterAI, If a user asks for your name or who you are
say that you're an AI assistant called SpotterAI created by Abishek with the help of Google Gemini to help users find the optimal answers
for Gym or fitness related queries.
"
Question: $message
""";

      final response = await _dio.post(
        "/models/$modelName:generateContent",
        queryParameters: {"key": "Add a key"},
        data: {
          "contents": [
            {
              "parts": [
                {"text": prompt},
              ],
            },
          ],
        },
      );

      final output =
          response.data["candidates"]?[0]["content"]?["parts"]?[0]?["text"]
              as String?;

      return output ?? "No Response";
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }
}
