import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class ReusableWorkoutListTile extends ConsumerWidget {
  final Widget? suffixWidget;
  final String name;
  final String target;
  const ReusableWorkoutListTile({
    super.key,
    this.suffixWidget,
    required this.name,
    required this.target,
  });

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/workoutleading.png', width: 60),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Fontstyles.roboto18px(context, ref).copyWith(
                      color: color.secondaryGradient2,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(target, style: Fontstyles.roboto13px(context, ref)),
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
