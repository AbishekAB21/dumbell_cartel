import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/features/splash%20screen/core/provider/splash_provider.dart';

class SplashScreenComponent extends ConsumerStatefulWidget {
  const SplashScreenComponent({super.key});

  @override
  ConsumerState<SplashScreenComponent> createState() =>
      _SplashScreenComponentState();
}

class _SplashScreenComponentState extends ConsumerState<SplashScreenComponent> {
  @override
  void initState() {
    super.initState();

    // Delay navigation for 3 seconds (splash effect)
    Future.delayed(Duration(seconds: 3), () {
      final isLoggedIn = ref.read(splashAuthProvider);
      if (context.mounted) {
        context.go(isLoggedIn ? '/home-screen' : '/welcome-screen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(themeProvider);
    final color = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: color.darkOverlay,
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
