import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/features/AI%20Section/core/model/ai_chat_model.dart';
import 'package:dumbell_cartel/features/AI%20Section/widgets/ai_screen_placeholder.dart';
import 'package:dumbell_cartel/features/AI%20Section/core/provider/ai_screen_provider.dart';

class AiScreenComponent extends ConsumerStatefulWidget {
  const AiScreenComponent({super.key});

  @override
  ConsumerState<AiScreenComponent> createState() => _AiScreenComponentState();
}

class _AiScreenComponentState extends ConsumerState<AiScreenComponent> {
  final _userMsgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final color = ref.watch(themeProvider);
    final message = ref.watch(aiChatProvider);

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
              Expanded(
                child: message.isEmpty
                    ?
                      // Placholder ( Appears when the user haven't given a prompt )
                      const AiScreenPlaceholder()
                    : ListView.builder(
                        itemCount: message.length,
                        itemBuilder: (context, index) {
                          final msg = message[index];

                          // If User
                          if (msg.sender == Sender.user) {
                            return Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                padding: const EdgeInsets.all(12),
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.7,
                                ),
                                decoration: BoxDecoration(
                                  color: color.textfieldBackground,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  msg.text,
                                  style: TextStyle(color: color.iconColor),
                                ),
                              ),
                            );
                          } else {
                            // If AI
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 8,
                                ),
                                child: Text(
                                  msg.text,
                                  style: Fontstyles.roboto15px(context, ref),
                                ),
                              ),
                            );
                          }
                        },
                      ),
              ),
              // Spacer(),

              // Input Section
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: _userMsgController,
                      style: Fontstyles.roboto15px(context, ref),
                      minLines: 1,
                      maxLines: 5,
                      decoration: InputDecoration(
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(
                            color: color.secondaryGradient1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(
                            color: color.textfieldBackground2,
                          ),
                        ),
                        fillColor: color.textfieldBackground,
                        filled: true,
                        hint: Text("Tap here to start working with SpotterAI"),
                        hintStyle: Fontstyles.roboto12Hintpx(context, ref),
                        hintFadeDuration: Duration(milliseconds: 300),
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),

                  SizedBox(width: 10.0),

                  GestureDetector(
                    onTap: () {
                      final text = _userMsgController.text.trim();

                      if (text.isNotEmpty) {
                        // Add User message onto the screen
                        ref.read(aiChatProvider.notifier).addUserMessage(text);

                        // TODO: Mock AI Response - (Replace with real AI response)

                        Future.delayed(Duration(milliseconds: 600), () {
                          ref
                              .read(aiChatProvider.notifier)
                              .addAIresponse("This is a MockAI response.");
                        });

                        _userMsgController.clear();
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(color: color.textfieldBackground2),
                        borderRadius: BorderRadius.circular(16.0),
                        color: color.textfieldBackground,
                      ),
                      child: Icon(
                        Icons.send_rounded,
                        color: color.secondaryGradient1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
