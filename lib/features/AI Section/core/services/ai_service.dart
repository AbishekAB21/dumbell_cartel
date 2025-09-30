import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://generativelanguage.googleapis.com/v1beta",
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
        // "Authorization": dotenv.env["GEMINI_API_KEY"],
        // "Authorization": "AIzaSyD6-LhCnW9oQD-4KL34C5rOwUfDtkGVo4Q",
      },
    ),
  );

  // Send message to AI
  Future<String> sendMessage({
    required String modelName,
    required String message,
  }) async {
    try {
      final response = await _dio.post(
        "/models/$modelName:generateContent", // endpoint
        queryParameters: {
          "key": "AIzaSyD6-LhCnW9oQD-4KL34C5rOwUfDtkGVo4Q", // Key
        },
        data: {
          "contents": [
            {
              "parts": [
                {"text": message},
              ],
            },
          ],
        },
      );

      // Gemini response
      final output =
          response.data["candidates"]?[0]["content"]?["parts"]?[0]?["text"]
              as String?;

      return output ?? "No Response";
    } catch (e) {
      throw Exception("Something went wrong : $e");
    }
  }
}
