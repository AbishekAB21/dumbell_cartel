import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class TipsScreenComponent extends ConsumerWidget {
  TipsScreenComponent({super.key});

  // TODO: Replace with dynamic data
  final List<String> tips = [
    "Set up the bench at an incline of about 30–45 degrees.",
    "Pick dumbbells that challenge you but allow full control.",
    "Sit on the bench with dumbbells on your thighs, then lie back and kick them up to shoulder level.",
    "Hold the dumbbells just outside your chest line with palms facing forward.",
    "Keep your feet flat on the floor and shoulder blades retracted.",
    "Press the dumbbells upward and slightly toward each other until arms are almost straight.",
    "Lower the dumbbells slowly to chest level, feeling a stretch in your upper chest.",
    "Exhale as you press up, inhale as you lower down.",
    "Focus on squeezing your upper chest at the top of the movement.",
    "Perform 3–4 sets of 8–12 controlled reps.",
    "Avoid setting the bench too high (turns into a shoulder press).",
    "Avoid bouncing the dumbbells or rushing the movement.",
    "Avoid using weights you can’t control or not lowering enough for a full stretch.",
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: color.background,
      appBar: AppBar(backgroundColor: color.background, toolbarHeight: 30),

      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 20.0,
          right: 15.0,
          left: 15.0,
          top: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.tips_and_updates,size: 30,color: color.secondaryGradient2,),
                SizedBox(width: 5.0),
                Text('Tips',style: Fontstyles.roboto20px(context, ref),),
              ],
            ),
            SizedBox(height: 30.0),
      
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                
                image: DecorationImage(
                  image: AssetImage("assets/images/incline-dumbell.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.8,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Incline Dumbbell Press",
              style: Fontstyles.roboto30px(
                context,
                ref,
              ).copyWith(color: color.secondaryGradient2),
            ),
            SizedBox(height: 5.0),
            RichText(
              text: TextSpan(
                text: 'Target region: ',
                style: Fontstyles.roboto16pxSemiBold(context, ref),
                children: [
                  TextSpan(
                    text: 'Upper Chest',
                    style: Fontstyles.roboto16pxSemiBoldBlue(context, ref),
                  ),
                ],
              ),
            ),
      
            SizedBox(height: 20.0),
      
            // Instruction builder
            Text(
              "How to do it?",
              style: Fontstyles.roboto25px(
                context,
                ref,
              ).copyWith(color: color.secondaryGradient2),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final tip = tips[index];
                  return Row(
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        color: color.secondaryGradient2,
                        size: 30,
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: Text(
                          tip,
                          textAlign: TextAlign.justify,
                          style: Fontstyles.roboto17Bold(context, ref),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 8.0),
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
