import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class DateNavigationSection extends ConsumerWidget {
  const DateNavigationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  label: Text(
                    "Today",
                    style: Fontstyles.roboto16pxSemiBoldGreen(context, ref),
                  ),
                  icon: Icon(
                    Icons.today_rounded,
                    color: color.secondaryGradient1,
                  ),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      color.textfieldBackground,
                    ),
                  ),
                ),

                SizedBox(width: 10.0),

                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: color.iconColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: color.iconColor,
                  ),
                ),

                SizedBox(height: 10.0),

                Text(
                  "October 20-24, 2025",
                  style: Fontstyles.roboto16pxSemiBold(context, ref),
                ),
              ],
            );
  }
}