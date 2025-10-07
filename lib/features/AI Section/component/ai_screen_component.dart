import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/features/AI%20Section/widgets/chat_input_section.dart';
import 'package:dumbell_cartel/features/AI%20Section/widgets/chat_content_section.dart';
import 'package:dumbell_cartel/features/AI%20Section/core/provider/ai_screen_provider.dart';

class AiScreenComponent extends ConsumerStatefulWidget {
  const AiScreenComponent({super.key});

  @override
  ConsumerState<AiScreenComponent> createState() => _AiScreenComponentState();
}

class _AiScreenComponentState extends ConsumerState<AiScreenComponent> {
  final userMsgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final color = ref.watch(themeProvider);
    final aiState = ref.watch(aiChatProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: color.background,
          toolbarHeight: 20,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Powered by Gemini",
                style: Fontstyles.roboto15px(context, ref),
              ),
              ImageIcon(AssetImage("assets/images/gemini.png"), size: 30),
            ],
          ),
        ),
        backgroundColor: color.background,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ChatContentSection(
                message: aiState.messages,
                isLoading: aiState.isLoading,
              ),

              // Input Section
              ChatInputSection(userMsgController: userMsgController),
            ],
          ),
        ),
      ),
    );
  }
}
