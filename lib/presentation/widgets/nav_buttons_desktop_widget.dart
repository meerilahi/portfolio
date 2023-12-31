import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/route_constants.dart';
import 'package:portfolio/presentation/widgets/nav_buttons_desktop.dart';

class NavButtonsDesktopWidget extends StatelessWidget {
  const NavButtonsDesktopWidget({
    super.key,
    required this.currentRouteName,
  });

  final String currentRouteName;

  @override
  Widget build(BuildContext context) {
    return NavButtonsDesktop(
      currentRouteName: currentRouteName,
      animatedButtonDataItems: [
        AnimatedButtonDataItem(
          iconData: Icons.home,
          label: "Home",
          routeName: AppRouteNames.homeRouteName,
        ),
        AnimatedButtonDataItem(
          iconData: Icons.person,
          label: "About",
          routeName: AppRouteNames.aboutRouteName,
        ),
        AnimatedButtonDataItem(
          iconData: Icons.business_center_sharp,
          label: "Portfolio",
          routeName: AppRouteNames.portfolioRouteName,
        ),
        AnimatedButtonDataItem(
          iconData: Icons.email,
          label: "Contact",
          routeName: AppRouteNames.contactRouteName,
        ),
      ],
    );
  }
}
