import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class ReusableButton extends ConsumerWidget {
  final String title;
  final void Function()? onPressed;
  const ReusableButton({super.key, required this.title, this.onPressed});

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
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
              colors: [
                color.secondaryGradient1,
                color.secondaryGradient2,
                
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: Fontstyles.roboto18px(
                context,
                ref,
              ).copyWith(fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
