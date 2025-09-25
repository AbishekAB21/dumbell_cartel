import 'package:flutter_riverpod/legacy.dart';

import 'package:dumbell_cartel/features/AI%20Section/core/model/ai_chat_model.dart';

/// Handles State Management for the entire AI Screen

final aiChatProvider = StateNotifierProvider<AiChatNotifier, List<AiChatModel>>(
  (ref) => AiChatNotifier(),
);

class AiChatNotifier extends StateNotifier<List<AiChatModel>> {
  AiChatNotifier() : super([]);

  // For the User
  void addUserMessage(String text) {
    state = [...state, AiChatModel(text: text, sender: Sender.user)];
  }

  // For the AI
  void addAIresponse(String text) {
    state = [...state, AiChatModel(text: text, sender: Sender.ai)];
  }

  // Clear chat
  void clearChat() {
    state = [];
  }
}
