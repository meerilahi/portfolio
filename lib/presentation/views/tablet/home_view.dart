import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/route_constants.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/data/repo/repository.dart';
import 'package:portfolio/presentation/widgets/animated_button_large.dart';
import 'package:portfolio/presentation/widgets/home_clipper.dart';
import 'package:portfolio/presentation/widgets/nav_buttons_desktop_widget.dart';
import 'package:provider/provider.dart';

class HomeViewTablet extends StatelessWidget {
  const HomeViewTablet({
    Key? key,
    required this.currentRouteName,
  }) : super(key: key);

  final String currentRouteName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: FutureBuilder(
          future: Provider.of<FirebaseRepository>(context).getHomeData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                final homeData = snapshot.data;
                if (homeData == null) {
                  return const Center(
                    child: Text("No Data to show"),
                  );
                }
                return Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: ClipPath(
                        clipper: HomeClipper1(),
                        child: Container(
                          width: size.width / 4,
                          height: size.height,
                          color: green,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: size.width > 800 ? 280 : 230,
                                  maxHeight: size.height * 0.6,
                                  minHeight: size.height * 0.6,
                                ),
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(),
                                child: homeData.imageLink != null
                                    ? Image(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(homeData.imageLink!),
                                        filterQuality: FilterQuality.high,
                                      )
                                    : const Image(
                                        image: AssetImage(
                                            "assets/images/haya.jpeg"),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: size.width > 800 ? 450 : 360),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: ("- \tI'm " + homeData.name + "\n")
                                      .toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 28),
                                  children: [
                                    TextSpan(
                                      text: ("\t\t" + homeData.role)
                                          .toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(fontSize: 28),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                homeData.introPara,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 20),
                              AnimatedButtonLarge(
                                iconData: Icons.keyboard_arrow_right_rounded,
                                label: "More About Me".toUpperCase(),
                                onPressed: () async {
                                  context.goNamed(AppRouteNames.aboutRouteName);
                                },
                                size: const Size(240, 48),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(
                          flex: 7,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NavButtonsDesktopWidget(
                            currentRouteName: currentRouteName,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              default:
                return const Center(
                  child: Text("Unable to load data"),
                );
            }
          }),
    );
  }
}
