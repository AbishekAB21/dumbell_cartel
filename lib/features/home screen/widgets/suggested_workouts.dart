import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:go_router/go_router.dart';

class SuggestedWorkouts extends ConsumerWidget {
  const SuggestedWorkouts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Strength tracker",
                style: Fontstyles.roboto20px(context, ref),
              ),
              IconButton(
                onPressed: () {
                  showCupertinoDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: color.textfieldBackground,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info, color: color.secondaryGradient2,size: 50,),
                          SizedBox(height: 10.0,),
                          Text(
                            "Strength tracker",
                            style: Fontstyles.roboto22px(
                              context,
                              ref,
                            ).copyWith(color: color.secondaryGradient2),
                          ),
                        ],
                      ),
                      content: Text(
                        "Search for the workouts you've done, log your PRs and keep track of your progress!",
                        style: Fontstyles.roboto15px(context, ref),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.info, color: color.secondaryGradient2),
              ),
            ],
          ),
        ),
        SizedBox(height: 15.0),
        SizedBox(
          height: 165,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => context.push('/suggestedworkouts-screen'),
              child: Container(
                width: 180,
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

                  image: DecorationImage(
                    image: AssetImage("assets/images/chest.png"),
                    fit: BoxFit.contain,
                    alignment: AlignmentGeometry.bottomRight,
                  ),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chest",
                      style: Fontstyles.roboto30px(context, ref),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Difficulty : Expert",
                      style: Fontstyles.roboto16pxSemiBold(context, ref),
                    ),
                  ],
                ),
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
