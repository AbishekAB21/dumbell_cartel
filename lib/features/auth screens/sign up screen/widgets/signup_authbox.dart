import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/widgets/reusable_button.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/common/widgets/reusable_textfields.dart';

class SignupAuthbox extends ConsumerWidget {
  const SignupAuthbox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color.textfieldBackground.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(16.0),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sign Up", style: Fontstyles.roboto30px(context, ref)),

          SizedBox(height: 30),

          ReusableTextfield(hinttext: "Username", icon: Icons.person),

          SizedBox(height: 30.0),

          ReusableTextfield(hinttext: "Email", icon: Icons.email),

          SizedBox(height: 30.0),

          ReusableTextfield(
            hinttext: "Password",
            icon: Icons.password,
            isObscure: true,
          ),

          SizedBox(height: 15.0),

          Align(
            alignment: AlignmentGeometry.bottomRight,
            child: Text(
              "Forgot Passworrd?",
              style: Fontstyles.roboto15pxNoColor(context, ref),
            ),
          ),

          SizedBox(height: 40.0),

          ReusableButton(
            title: "Sign up",
            onPressed: () {
              context.pushReplacement('/home-screen');
            },
          ),

          SizedBox(height: 20.0),

          Center(
            child: RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: Fontstyles.roboto16pxLight(context, ref),
                children: [
                  TextSpan(
                    text: 'Sign In',
                    style: Fontstyles.roboto16pxSemiBoldBlue(context, ref),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.push('/signin-screen');
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
