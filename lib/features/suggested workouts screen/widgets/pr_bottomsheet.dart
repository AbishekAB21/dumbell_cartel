import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/features/suggested%20workouts%20screen/widgets/pr_button.dart';
import 'package:dumbell_cartel/features/suggested%20workouts%20screen/widgets/pr_textfield.dart';
import 'package:go_router/go_router.dart';

class PrBottomsheet extends ConsumerWidget {
  const PrBottomsheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0, // Horizontal blur strength
          sigmaY: 10.0, // Vertical blur strength
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: color.textfieldBackground2.withValues(
                alpha: 0.5,
              ), // semi-transparent overlay
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 30.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: color.iconColor.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: color.darkOverlay,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/incline-dumbell.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Column(
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
                    ],
                  ),

                  SizedBox(height: 10.0),

                  Divider(color: color.iconColor),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                        left: 40.0,
                        right: 40.0,
                        bottom: 10.0,
                      ),
                      child: Column(
                        children: [
                          IconButton(
                            tooltip: "Workout tips",

                            onPressed: () {
                              context.pop();

                              context.push(
                                '/workouttips-screen',
                              ); // use context while widget is still active
                            },
                            icon: Icon(
                              Icons.tips_and_updates_rounded,
                              size: 30,
                              color: color.secondaryGradient2,
                            ),
                          ),

                          Text(
                            "What is the heaviest weight you lifted?",
                            style: Fontstyles.roboto25px(context, ref),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "Weight to Log: Both Dumbells",
                            style: Fontstyles.roboto13Hintpx(context, ref),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 20.0),

                          // Textfields
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PrTextfield(labelText: "Weight (Kg)"),
                              SizedBox(width: 15.0),
                              Text(
                                "X",
                                style: Fontstyles.roboto35px(context, ref)
                                    .copyWith(
                                      color: color.iconColor.withValues(
                                        alpha: 0.85,
                                      ),
                                    ),
                              ),
                              SizedBox(width: 15.0),
                              PrTextfield(labelText: "Reps"),
                            ],
                          ),

                          SizedBox(height: 40.0),

                          PrButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
