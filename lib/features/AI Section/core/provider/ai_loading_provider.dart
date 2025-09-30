import 'package:dumbell_cartel/features/AI%20Section/core/model/ai_chat_model.dart';

class AiScreenState {
  final List<AiChatModel> messages;
  final bool isLoading;

  AiScreenState({
    required this.messages,
    this.isLoading = false,
  });

  AiScreenState copyWith({
    List<AiChatModel>? messages,
    bool? isLoading,
  }) {
    return AiScreenState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
