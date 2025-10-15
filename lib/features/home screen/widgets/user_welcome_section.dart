import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class UserWelcomeSection extends ConsumerWidget {
  final String userName;
  const UserWelcomeSection({super.key, required this.userName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Row(
          children: [
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: color.secondaryGradient2,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: color.secondaryGradient2,
                backgroundImage: AssetImage("assets/images/profile.jpg"),
              ),
            ),
            SizedBox(width: 10.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Hi,",
                    style: Fontstyles.roboto16pxSemiBold(
                      context,
                      ref,
                    ).copyWith(fontSize: 17),
                  ),
                  TextSpan(
                    text: " Abishek!",
                    style: Fontstyles.roboto16pxSemiBoldGreen(
                      context,
                      ref,
                    ).copyWith(fontSize: 17),
                  ),
                ],
              ),
            ),
          ],
        );
  }
}