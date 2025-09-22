import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class HomeScreenComponent extends ConsumerWidget {
  const HomeScreenComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: color.background,

      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: color.background,
        leading: CircleAvatar(
          radius: 50,
          backgroundColor: color.secondaryGradient1,
          // backgroundImage: ,
        ),

        title: Text(
          "Hello, Abishek",
          style: Fontstyles.roboto15px(context, ref),
        ),

        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Center(
              child: CircularPercentIndicator(
                radius: 120,
                animation: true,
                animationDuration: 700,
                backgroundColor: color.textfieldBackground,
                backgroundWidth: 12,
                percent: 0.75,
                progressColor: color.secondaryGradient1,
                lineWidth: 50,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Burn",
                      style: Fontstyles.roboto16pxSemiBold(context, ref),
                    ),
                    Text("60%", style: Fontstyles.roboto35px(context, ref)),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30.0),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Workout Log",
                style: Fontstyles.roboto20px(context, ref),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
