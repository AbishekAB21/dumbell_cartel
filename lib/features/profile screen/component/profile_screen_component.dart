import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/features/profile%20screen/widgets/profile_screen_tile.dart';
import 'package:dumbell_cartel/features/profile%20screen/widgets/calorie_steps_section.dart';

class ProfileScreenComponent extends ConsumerWidget {
  const ProfileScreenComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: color.background,
      appBar: AppBar(backgroundColor: color.background, toolbarHeight: 20),
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: color.secondaryGradient1,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: color.background,
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                ),

                SizedBox(width: 30.0),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "Phil\n", // add \n if you want them on separate lines
                        style: Fontstyles.roboto30px(context, ref),
                      ),
                      TextSpan(
                        text: "Foden",
                        style: Fontstyles.roboto35px(context, ref).copyWith(
                          fontSize: 50,
                          color: color.secondaryGradient1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),

            CalorieStepsSection(),

            SizedBox(height: 30.0),

            ProfileScreenTile(
              title: "Account Settings",
              leadingIcon: Icons.person,
            ),

            SizedBox(height: 20.0),

            ProfileScreenTile(
              title: "Configure health targets",
              leadingIcon: Icons.sports_gymnastics,
            ),

            Spacer(),

            Text("Version 1.0", style: Fontstyles.roboto12Hintpx(context, ref)),
          ],
        ),
      ),
    );
  }
}
