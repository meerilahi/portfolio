import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/data/models/contact_data_model.dart';
import 'package:portfolio/data/repo/repository.dart';
import 'package:portfolio/presentation/widgets/animated_round_icon_button.dart';
import 'package:portfolio/presentation/widgets/contact_form_widget.dart';
import 'package:portfolio/presentation/widgets/nav_buttons_desktop_widget.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

class ContactViewDesktop extends StatelessWidget {
  const ContactViewDesktop({
    Key? key,
    required this.currentRouteName,
  }) : super(key: key);
  final String currentRouteName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Center(
            child: Column(
              children: [
                const SizedBox(height: 120),
                RichText(
                  text: TextSpan(
                    text: "Get in ".toUpperCase(),
                    style: Theme.of(context).textTheme.headlineLarge,
                    children: [
                      TextSpan(
                        text: "Touch".toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 1400,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      FutureBuilder<ContactInfoDataModel>(
                          future: Provider.of<FirebaseRepository>(context)
                              .getContactInfoData(),
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              case ConnectionState.done:
                                final data = snapshot.data;
                                if (data == null) {
                                  return const Center(
                                    child: Text("No data to show"),
                                  );
                                }

                                return Container(
                                  width: 400,
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Don't be shy".toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "Feel free to contact me",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      const SizedBox(height: 20),
                                      ListTile(
                                        contentPadding: const EdgeInsets.all(0),
                                        leading: const Icon(
                                          Icons.email,
                                          color: green,
                                          size: 46,
                                        ),
                                        title: Text(
                                          "Mail me".toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.w300),
                                        ),
                                        subtitle: SelectableText(
                                          data.email,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      ListTile(
                                        contentPadding: const EdgeInsets.all(0),
                                        leading: const Icon(
                                          Icons.phone,
                                          color: green,
                                          size: 46,
                                        ),
                                        title: Text(
                                          "Call me".toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.w300),
                                        ),
                                        subtitle: SelectableText(
                                          data.contactNumber,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        children: [
                                          AnimatedRoundIconButton(
                                            size: 40,
                                            iconData: FontAwesomeIcons.github,
                                            onPressed: () {
                                              html.window.open(
                                                data.githubLink,
                                                "_blank",
                                              );
                                              debugPrint("Tapped github");
                                            },
                                          ),
                                          AnimatedRoundIconButton(
                                            size: 40,
                                            iconData: FontAwesomeIcons.linkedin,
                                            onPressed: () {
                                              html.window.open(
                                                data.linkedInLink,
                                                "_blank",
                                              );
                                            },
                                          ),
                                          AnimatedRoundIconButton(
                                            size: 40,
                                            iconData: FontAwesomeIcons.twitter,
                                            onPressed: () {
                                              html.window.open(
                                                data.twitterLink,
                                                "_blank",
                                              );
                                            },
                                          ),
                                          AnimatedRoundIconButton(
                                            size: 40,
                                            iconData: FontAwesomeIcons.link,
                                            onPressed: () {
                                              html.window.open(
                                                data.websiteLink,
                                                "_blank",
                                              );
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              default:
                                return const Center(
                                  child: Text("Unable to load data"),
                                );
                            }
                          }),
                      const Spacer(
                        flex: 1,
                      ),
                      const ContactFormWidget(),
                      const Spacer(flex: 2),
                    ],
                  ),
                )
              ],
            ),
          )),
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
      ),
    );
  }
}
