import 'package:flutter/material.dart';
import 'package:dumbell_cartel/features/bottom%20nav%20bar/component/bottom_nav_bar_component.dart';

class BottomNavBarContainer extends StatelessWidget {
   final Widget child;
  const BottomNavBarContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BottomNavBarComponent(child: child,);
  }
}
