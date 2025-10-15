import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_top_snackbar/flutter_top_snackbar.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/widgets/reusable_button.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/common/widgets/reusable_textfields.dart';
import 'package:dumbell_cartel/features/auth%20screens/sign%20in%20screen/core/database/sign_in_db.dart';

class SignInAuthbox extends ConsumerWidget {
  SignInAuthbox({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
          Text("Sign In", style: Fontstyles.roboto30px(context, ref)),

          SizedBox(height: 30),

          ReusableTextfield(
            hinttext: "Email",
            icon: Icons.email,
            cntrlr: emailController,
          ),

          SizedBox(height: 30.0),

          ReusableTextfield(
            hinttext: "Password",
            icon: Icons.password,
            isObscure: true,
            cntrlr: passwordController,
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
            title: "Sign in",
            onPressed: () async {
              if (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                try {
                  await SignInDb().signInUserWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                  );
                  if (context.mounted) {
                    context.go('/home-screen');
                    FlutterTopSnackbar.show(
                      context,
                      "Logged in!",
                      padding: EdgeInsets.all(15.0),
                      showCloseButton: false,
                      customIcon: Icons.check_rounded,
                      messageFontstyle: Fontstyles.roboto17Bold(context, ref),
                      borderRadius: 15.0,
                      animationType: AnimationTypes.slideFromTop,
                      elevation: 4,
                      customBackgroundColor: color.secondaryGradient2,
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    FlutterTopSnackbar.show(
                      context,
                      "Something went wrong",
                      padding: EdgeInsets.all(15.0),
                      customIcon: Icons.error,
                      showCloseButton: false,
                      messageFontstyle: Fontstyles.roboto17Bold(context, ref),
                      borderRadius: 15.0,
                      animationType: AnimationTypes.slideFromTop,
                      elevation: 4,
                      customBackgroundColor: color.errorColor,
                    );
                  }
                }
              } else {
                FlutterTopSnackbar.show(
                  context,
                  "Please fill all the credentials",
                  padding: EdgeInsets.all(15.0),
                  closeButtonSize: 10,
                  customIcon: Icons.warning,
                  showCloseButton: false,
                  messageFontstyle: Fontstyles.roboto17Bold(context, ref),
                  borderRadius: 15.0,
                  animationType: AnimationTypes.slideFromTop,
                  elevation: 4,
                  customBackgroundColor: color.warningColor,
                );
              }
            },
          ),

          SizedBox(height: 20.0),

          Center(
            child: RichText(
              text: TextSpan(
                text: 'New around here? ',
                style: Fontstyles.roboto16pxLight(context, ref),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: Fontstyles.roboto16pxSemiBoldGreen(context, ref),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.push('/signup-screen');
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
