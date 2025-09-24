import 'package:dumbell_cartel/common/widgets/reusable_textfields.dart';
import 'package:dumbell_cartel/features/AI%20Section/widgets/ai_screen_placeholder.dart';
import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:flutter_svg/svg.dart';

class AiScreenComponent extends ConsumerWidget {
  const AiScreenComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
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
              // Placholder ( Appears when the user haven't given a prompt )
              AiScreenPlaceholder(),
              Spacer(),

              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      style: Fontstyles.roboto15px(context, ref),
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
                    onTap: () {},
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
