import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/features/AI%20Section/core/model/ai_chat_model.dart';
import 'package:dumbell_cartel/features/AI%20Section/widgets/ai_screen_placeholder.dart';

class ChatContentSection extends ConsumerWidget {
  final List<AiChatModel> message;
  final bool isLoading;

  const ChatContentSection({
    super.key,
    required this.message,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);

    // When there are no messages
    if (message.isEmpty) {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            const SizedBox(height: 50), 
            if (isLoading)
              Lottie.asset(
                "assets/animations/Loading_green_dots.json",
                width: 60,
                height: 40,
                fit: BoxFit.cover,
                repeat: true,
              )
            else
              const AiScreenPlaceholder(),
          ],
        ),
      );
    }

    // When there are messages
    return Expanded(
      child: ListView.builder(
        itemCount: message.length + (isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          // Typing animation
          if (isLoading && index == message.length) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Lottie.asset(
                "assets/animations/Loading_green_dots.json",
                width: 60,
                height: 40,
                fit: BoxFit.cover,
                repeat: true,
              ),
            );
          }

          final msg = message[index];

          // User message
          if (msg.sender == Sender.user) {
            return Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.all(12),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                decoration: BoxDecoration(
                  color: color.textfieldBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(msg.text, style: TextStyle(color: color.iconColor)),
              ),
            );
          } else {
            // AI response
            return Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: MarkdownBody(
                  data: msg.text,
                  styleSheet: MarkdownStyleSheet(
                    textAlign: WrapAlignment.start,
                    p: Fontstyles.roboto15px(context, ref),
                    strong: Fontstyles.roboto15px(context, ref)
                        .copyWith(fontWeight: FontWeight.bold),
                    em: Fontstyles.roboto15px(context, ref)
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

