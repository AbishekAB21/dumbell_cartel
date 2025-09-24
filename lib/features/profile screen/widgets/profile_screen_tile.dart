import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class ProfileScreenTile extends ConsumerWidget {
  final String title;
  final IconData leadingIcon;
  const ProfileScreenTile({
    super.key,
    required this.title,
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color.secondaryGradient2,
        borderRadius: BorderRadius.circular(10.0),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color.iconColor,
                child: Icon(leadingIcon, color: color.secondaryGradient2),
              ),
              SizedBox(width: 10.0),
              Text(title, style: Fontstyles.roboto17Bold(context, ref)),
            ],
          ),
          Icon(Icons.arrow_forward_ios_rounded),
        ],
      ),
    );
  }
}
