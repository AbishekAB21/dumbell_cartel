import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class SearchBox extends ConsumerWidget {
  final void Function(String)? onChanged;
  final TextEditingController? cntrlr;
  const SearchBox({super.key, required this.onChanged, this.cntrlr});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return TextFormField(
      controller: cntrlr,
      style: Fontstyles.roboto15px(context, ref),
      decoration: InputDecoration(
        isDense: true,
        hintText: "Search for a workout",
        hintStyle: Fontstyles.roboto13Hintpx(context, ref),
        hintFadeDuration: Duration(milliseconds: 500),
        prefixIcon: Icon(Icons.search, color: color.iconColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: color.secondaryGradient2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: color.textfieldBackground2),
        ),
      ),
      onChanged: onChanged,
    );
  
  }
}
