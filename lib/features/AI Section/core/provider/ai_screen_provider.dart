import 'package:dumbell_cartel/features/AI%20Section/core/provider/ai_loading_provider.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/features/AI%20Section/core/services/ai_service.dart';
import 'package:dumbell_cartel/features/AI%20Section/core/model/ai_chat_model.dart';

/// AI Service provider
final aiServiceProvider = Provider<AiService>((ref) => AiService());

/// Handles State Management for the entire AI Screen
final aiChatProvider =
    StateNotifierProvider<AiChatNotifier, AiScreenState>(
  (ref) => AiChatNotifier(ref),
);

class AiChatNotifier extends StateNotifier<AiScreenState> {
  final Ref _ref;

  AiChatNotifier(this._ref) : super(AiScreenState(messages: []));

  void addUserMessage(String text) {
    final updated = [
      ...state.messages,
      AiChatModel(text: text, sender: Sender.user),
    ];
    state = state.copyWith(messages: updated);
  }

  Future<void> sendMessage(String text) async {
    addUserMessage(text);

    // Show loading
    state = state.copyWith(isLoading: true);

    try {
      final response = await _ref
          .read(aiServiceProvider)
          .sendMessage(modelName: "gemini-2.5-flash", message: text);

      final updated = [
        ...state.messages,
        AiChatModel(text: response, sender: Sender.ai),
      ];
      state = state.copyWith(messages: updated, isLoading: false);
    } catch (e) {
      final updated = [
        ...state.messages,
        AiChatModel(text: "⚠️ Something went wrong: $e", sender: Sender.ai),
      ];
      state = state.copyWith(messages: updated, isLoading: false);
      print("⚠️ Something went wrong: $e");
    }
  }

  void clearChat() {
    state = AiScreenState(messages: []);
  }
}

