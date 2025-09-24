import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class AiScreenPlaceholder extends ConsumerWidget {
  const AiScreenPlaceholder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Column(
     
      children: [
        ImageIcon(
          AssetImage("assets/images/aiLogo.png"),
          size: 300,
          color: color.secondaryGradient1,
        ),
        Text("SpotterAI", style: Fontstyles.roboto35px(context, ref)),
        SizedBox(height: 10.0),
        Text(
          "Your personal AI fitness coach! Pick your goals and preferences, and get a customized workout split tailored just for you!",
          style: Fontstyles.roboto13Hintpx(context, ref),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.0),
        Text(
          "So, how can I help you?",
          style: Fontstyles.roboto16pxSemiBold(context, ref),
        ),
      ],
    );
  }
}
