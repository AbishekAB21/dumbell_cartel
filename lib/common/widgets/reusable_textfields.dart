import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class ReusableTextfield extends ConsumerWidget {
  final String hinttext;
  final IconData? icon;
  final bool? isObscure;
  const ReusableTextfield({
    super.key,
    required this.hinttext,
    this.icon,
    this.isObscure,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return TextFormField(
      style: Fontstyles.roboto15px(context, ref),
      obscureText: isObscure ?? false,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color.secondaryGradient1),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color.textfieldBackground2),
        ),
        hintText: hinttext,
        hintStyle: Fontstyles.roboto12Hintpx(context, ref),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
