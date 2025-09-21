import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class SplashScreenComponent extends ConsumerWidget {
  const SplashScreenComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeProvider);
    final color = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: color.background,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dumbell.jpg"),
                fit: BoxFit.cover,
                opacity: 0.50,
              ),
            ),
          ),

          Center(
            child: Image.asset("assets/images/dumbell_cartel.png", width: 200),
          ),
        ],
      ),
    );
  }
}