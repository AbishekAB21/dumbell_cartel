import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class PrButton extends ConsumerWidget {
  const PrButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, // removes default padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: (){},
        child: Ink(
          decoration: BoxDecoration(
            
            gradient: LinearGradient(
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
              colors: [
                color.secondaryGradient2.withValues(alpha: 0.80),
                color.secondaryGradient2.withValues(alpha: 0.60),
                color.secondaryGradient2.withValues(alpha: 0.90),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "Update PR",
              style: Fontstyles.roboto20px(context, ref),
            ),
          ),
        ),
      ),
    );
  }
}