import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/features/AI%20Section/container/ai_screen_container.dart';
import 'package:dumbell_cartel/features/home%20screen/container/home_screen_container.dart';
import 'package:dumbell_cartel/features/profile%20screen/containers/profile_screen_container.dart';
import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBarComponent extends ConsumerStatefulWidget {
  final Widget child;
  const BottomNavBarComponent({super.key, required this.child});

  @override
  ConsumerState<BottomNavBarComponent> createState() =>
      _CustomNavBarShellState();
}

class _CustomNavBarShellState extends ConsumerState<BottomNavBarComponent> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final color = ref.watch(themeProvider);
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        contentPadding: 5.0,
        textStyle: Fontstyles.roboto15px(context, ref),
        activeColorPrimary: color.secondaryGradient1,
        activeColorSecondary: color.secondaryGradient1,

        inactiveColorPrimary: color.textfieldBackground2,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage("assets/images/aiLogo.png"),
          size: 150,
        ),
        title: ("SpotterAI"),
        textStyle: Fontstyles.roboto15px(context, ref),
        activeColorPrimary: color.secondaryGradient1,
        activeColorSecondary: color.secondaryGradient1,
        inactiveColorPrimary: color.textfieldBackground2,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"),
        textStyle: Fontstyles.roboto15px(context, ref),
        activeColorPrimary: color.secondaryGradient1,
        activeColorSecondary: color.secondaryGradient1,
        inactiveColorPrimary: color.textfieldBackground2,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final color = ref.watch(themeProvider);
    return PersistentTabView(
      context,
      controller: _controller,

      screens: [
        const HomeScreenContainer(),
        const AiScreenContainer(),
        const ProfileScreenContainer(),
      ],
      items: _navBarsItems(),
      onItemSelected: (index) {
        switch (index) {
          case 0:
            context.go('/home-screen');
            break;
          case 1:
            context.go('/ai-screen');
            break;
          case 2:
            context.go('profile-screen');
        }
      },
      confineToSafeArea: true,
      backgroundColor: color.background,

      hideNavigationBarWhenKeyboardAppears: true,
      padding: EdgeInsets.all(10),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        colorBehindNavBar: color.background,
      ),

      navBarStyle: NavBarStyle.style12,
    );
  }
}
