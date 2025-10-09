import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/features/workout%20instructions/component/tips_screen_component.dart';

class TipsScreenContainer extends ConsumerWidget {
  const TipsScreenContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TipsScreenComponent();
  }
}