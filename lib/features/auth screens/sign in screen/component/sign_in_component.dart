import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/features/auth%20screens/sign%20in%20screen/widgets/sign_in_authbox.dart';

class SignInComponent extends ConsumerWidget {
  const SignInComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0,
                bottom: 30.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  // Logo
                  Center(
                    child: Image.asset(
                      "assets/images/dumbell_cartel.png",
                      width: 100,
                    ),
                  ),
            
                  Spacer(),
            
                  // Auth box
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: SignInAuthbox()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
