import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/common/providers/theme_provider.dart';

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

    Future.delayed(const Duration(seconds: 3), () {
      // final splashAuthCheck = ref.read(splashAuthProvider);

      // splashAuthCheck.whenData((isLoggedIn) {
      //   isLoggedIn
      //       ? context.go('/home-screen')
      //       : context.go('/welcome-screen');

      //   print('USER: _______ ${FirebaseAuth.instance.currentUser}');
      // });

      context.pushReplacement('/welcome-screen');
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
