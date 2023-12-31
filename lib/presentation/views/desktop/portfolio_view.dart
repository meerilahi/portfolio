import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/responsive_layout_constants.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/data/models/portfolio_data_model.dart';
import 'package:portfolio/data/repo/repository.dart';
import 'package:portfolio/presentation/widgets/drawer.dart';
import 'package:portfolio/presentation/widgets/nav_buttons_desktop_widget.dart';
import 'package:portfolio/presentation/widgets/sliding_image_card_widget.dart';
import 'package:provider/provider.dart';

class PortfolioViewDesktop extends StatelessWidget {
  const PortfolioViewDesktop({
    Key? key,
    required this.currentRouteName,
  }) : super(key: key);
  final String currentRouteName;

  @override
  Widget build(BuildContext context) {
    final count = MediaQuery.of(context).size.width > fBP ? 3 : 2;
    final bool phone = MediaQuery.of(context).size.width < fBP;
    return Scaffold(
      backgroundColor: white,
      drawer: drawer(context, currentRouteName),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 900,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 80),
                    RichText(
                      text: TextSpan(
                        text: "My ".toUpperCase(),
                        style: Theme.of(context).textTheme.headlineLarge,
                        children: [
                          TextSpan(
                            text: "Portfolio".toUpperCase(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),
                    FutureBuilder<PortfolioDataModel>(
                        future: Provider.of<FirebaseRepository>(context)
                            .getPortfolioData(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const Center(
                                  child: CircularProgressIndicator());
                            case ConnectionState.done:
                              final data = snapshot.data;
                              if (data == null) {
                                return const Center(
                                  child: Text("No data to show"),
                                );
                              }
                              return GridView.builder(
                                shrinkWrap: true,
                                itemCount: data.portfolioItems.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: count,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 1.5,
                                ),
                                itemBuilder: (context, index) {
                                  return SlidingImageCard(
                                    projectDetailItem:
                                        data.portfolioItems[index],
                                  );
                                },
                              );
                            default:
                              return const Center(
                                child: Text("Unable to load data"),
                              );
                          }
                        }),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: phone
                ? const DrawerButton()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NavButtonsDesktopWidget(
                        currentRouteName: currentRouteName,
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
