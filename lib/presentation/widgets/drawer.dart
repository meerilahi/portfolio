import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/route_constants.dart';
import 'package:portfolio/core/theme/colors.dart';

Drawer drawer(BuildContext context, String currentRouteName) {
  return Drawer(
    backgroundColor: white,
    child: Container(
      color: white,
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            TextButton.icon(
              onPressed: () {
                context.goNamed(AppRouteNames.homeRouteName);
              },
              icon: Icon(
                Icons.home,
                color: currentRouteName == AppRouteNames.homeRouteName
                    ? green
                    : mediumGrey,
                size: 28,
              ),
              label: Text(
                "Home",
                style: TextStyle(
                    color: currentRouteName == AppRouteNames.homeRouteName
                        ? green
                        : mediumGrey,
                    fontSize: 24),
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              color: lightGrey,
            ),
            const SizedBox(height: 5),
            TextButton.icon(
              onPressed: () {
                context.goNamed(AppRouteNames.aboutRouteName);
              },
              icon: Icon(
                Icons.person,
                color: currentRouteName == AppRouteNames.aboutRouteName
                    ? green
                    : mediumGrey,
                size: 28,
              ),
              label: Text(
                "About",
                style: TextStyle(
                    color: currentRouteName == AppRouteNames.aboutRouteName
                        ? green
                        : mediumGrey,
                    fontSize: 24),
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              color: lightGrey,
            ),
            const SizedBox(height: 5),
            TextButton.icon(
              onPressed: () {
                context.goNamed(AppRouteNames.portfolioRouteName);
              },
              icon: Icon(
                Icons.business_center_rounded,
                color: currentRouteName == AppRouteNames.portfolioRouteName
                    ? green
                    : mediumGrey,
                size: 28,
              ),
              label: Text(
                "Portfolio",
                style: TextStyle(
                    color: currentRouteName == AppRouteNames.portfolioRouteName
                        ? green
                        : mediumGrey,
                    fontSize: 24),
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              color: lightGrey,
            ),
            const SizedBox(height: 5),
            TextButton.icon(
              onPressed: () {
                context.goNamed(AppRouteNames.contactRouteName);
              },
              icon: Icon(
                Icons.person,
                color: currentRouteName == AppRouteNames.contactRouteName
                    ? green
                    : mediumGrey,
                size: 28,
              ),
              label: Text(
                "Contact",
                style: TextStyle(
                    color: currentRouteName == AppRouteNames.contactRouteName
                        ? green
                        : mediumGrey,
                    fontSize: 24),
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              color: lightGrey,
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    ),
  );
}
