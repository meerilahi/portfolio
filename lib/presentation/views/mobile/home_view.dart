import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/route_constants.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/data/repo/repository.dart';
import 'package:portfolio/presentation/widgets/animated_button_large.dart';
import 'package:portfolio/presentation/widgets/drawer.dart';
import 'package:portfolio/presentation/widgets/home_clipper.dart';
import 'package:provider/provider.dart';

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({
    Key? key,
    required this.currentRouteName,
  }) : super(key: key);

  final String currentRouteName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: drawer(context, currentRouteName),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: Provider.of<FirebaseRepository>(context).getHomeData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
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
                        right: 0,
                        top: 0,
                        child: ClipPath(
                          clipper: HomeClipper2(),
                          child: Container(
                            width: size.width,
                            height: size.height / 2.5,
                            color: green,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 80),
                            ClipOval(
                              child: Container(
                                width: 300,
                                height: 300,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
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
                            const SizedBox(height: 60),
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
                                    text:
                                        ("\t\t" + homeData.role).toUpperCase(),
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
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                      const Align(
                          alignment: Alignment.centerRight,
                          child: DrawerButton()),
                    ],
                  );
                default:
                  return const Center(
                    child: Text("Unable to load data"),
                  );
              }
            }),
      ),
    );
  }
}
