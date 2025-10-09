import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class PrTextfield extends ConsumerWidget {
  final String labelText;
  const PrTextfield({super.key, required this.labelText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Flexible(
      child: Column(
        children: [
          TextFormField(
            cursorColor: color.iconColor,
            maxLength: 4,
            keyboardType: TextInputType.number,
            style: Fontstyles.roboto35px(
              context,
              ref,
            ).copyWith(color: color.secondaryGradient1),
            
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              
              counterText: '',
              contentPadding: EdgeInsets.symmetric(vertical: 20),
              filled: true,
              fillColor: color.iconColor.withValues(alpha: 0.15),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: color.secondaryGradient2,width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          SizedBox(height: 10.0),

          Text(
            labelText,
            style: Fontstyles.roboto13px(
              context,
              ref,
            ).copyWith(color: color.iconColor.withValues(alpha: 0.70)),
          ),
        ],
      ),
    );
  }
}
