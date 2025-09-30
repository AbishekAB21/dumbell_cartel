import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/features/AI%20Section/core/provider/ai_screen_provider.dart';

class ChatInputSection extends ConsumerWidget {
  final TextEditingController userMsgController;
  const ChatInputSection({super.key, required this.userMsgController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: userMsgController,
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
                      final text = userMsgController.text.trim();

                      if (text.isNotEmpty) {
                        // Add User message onto the screen
                        ref.read(aiChatProvider.notifier).sendMessage(text);

                        userMsgController.clear();
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
              );
  }
}