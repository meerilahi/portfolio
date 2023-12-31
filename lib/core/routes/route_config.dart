import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/responsive_layout_constants.dart';
import 'package:portfolio/core/constants/route_constants.dart';
import 'package:portfolio/presentation/views/desktop/about_view.dart';
import 'package:portfolio/presentation/views/desktop/contact_view.dart';
import 'package:portfolio/presentation/views/desktop/home_view.dart';
import 'package:portfolio/presentation/views/desktop/portfolio_view.dart';
import 'package:portfolio/presentation/views/mobile/home_view.dart';
import 'package:portfolio/presentation/views/tablet/contact_view.dart';
import 'package:portfolio/presentation/views/tablet/home_view.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: AppRouteNames.homeRouteName,
        pageBuilder: (context, state) {
          final size = MediaQuery.of(context).size;
          if (size.width < fBP) {
            return const MaterialPage(
              child: HomeViewMobile(
                currentRouteName: AppRouteNames.homeRouteName,
              ),
            );
          } else if (size.width < sBP) {
            return const MaterialPage(
              child: HomeViewTablet(
                currentRouteName: AppRouteNames.homeRouteName,
              ),
            );
          } else {
            return const MaterialPage(
              child: HomeViewDesktop(
                currentRouteName: AppRouteNames.homeRouteName,
              ),
            );
          }
        },
      ),
      GoRoute(
        path: "/${AppRouteNames.aboutRouteName}",
        name: AppRouteNames.aboutRouteName,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: AboutViewDesktop(
              currentRouteName: AppRouteNames.aboutRouteName,
            ),
          );
        },
      ),
      GoRoute(
        path: "/${AppRouteNames.portfolioRouteName}",
        name: AppRouteNames.portfolioRouteName,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: PortfolioViewDesktop(
              currentRouteName: AppRouteNames.portfolioRouteName,
            ),
          );
        },
      ),
      GoRoute(
        path: "/${AppRouteNames.contactRouteName}",
        name: AppRouteNames.contactRouteName,
        pageBuilder: (context, state) {
          final size = MediaQuery.of(context).size;
          if (size.width < sBP) {
            return const MaterialPage(
              child: ContactViewTablet(
                currentRouteName: AppRouteNames.contactRouteName,
              ),
            );
          } else {
            return const MaterialPage(
              child: ContactViewDesktop(
                currentRouteName: AppRouteNames.contactRouteName,
              ),
            );
          }
        },
      ),
    ],
  );
}
