import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class ReusableWorkoutListTile extends ConsumerWidget {
  final Widget? suffixWidget;
  const ReusableWorkoutListTile({super.key, this.suffixWidget});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color.textfieldBackground2.withValues(alpha: 0.30),
          borderRadius: BorderRadius.circular(10.0),
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                color: color.darkOverlay,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("assets/images/incline-dumbell.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Incline Dumbbell Press",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Fontstyles.roboto18px(context, ref).copyWith(
                      color: color.secondaryGradient2,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "UPPER CHEST",
                    style: Fontstyles.roboto13Hintpx(context, ref),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            suffixWidget ??
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_circle, color: color.errorColor),
                ),

            SizedBox(width: 10.0),
          ],
        ),
      ),
    );
  }
}
