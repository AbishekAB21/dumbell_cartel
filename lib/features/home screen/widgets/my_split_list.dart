import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class MySplitList extends ConsumerWidget {
  const MySplitList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("My splits", style: Fontstyles.roboto20px(context, ref)),
        ),
        SizedBox(height: 15.0),
        SizedBox(
          height: 155,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              width: 200,
              padding: EdgeInsets.only(
                bottom: 10.0,
                left: 10.0,
                top: 20.0,
                right: 20.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: AlignmentGeometry.topLeft,
                  end: AlignmentGeometry.bottomRight,
                  tileMode: TileMode.decal,
                  colors: [
                    color.secondaryGradient2,
                    color.secondaryGradient1,
                    color.teritiaryColor,
                  ],
                ).withOpacity(0.70),
                color: color.darkOverlay,
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Push-Pull Leg",
                    style: Fontstyles.roboto30px(context, ref),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Workouts : 50",
                    style: Fontstyles.roboto12Hintpx(context, ref),
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(width: 10.0),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
