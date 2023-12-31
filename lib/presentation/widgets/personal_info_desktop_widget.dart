// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/responsive_layout_constants.dart';
import 'dart:html' as html;
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/presentation/widgets/animated_button_large.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({
    Key? key,
    required this.personalInfoListData,
    required this.personalInfoCardData,
    required this.cvLink,
  }) : super(key: key);

  final Map<String, String> personalInfoListData;
  final Map<String, String> personalInfoCardData;
  final String cvLink;

  @override
  Widget build(BuildContext context) {
    final listKeys = personalInfoListData.keys.toList();
    final cardKeys = personalInfoCardData.keys.toList();
    final size = MediaQuery.of(context).size;
    final int crossAxisCount = size.width > sBP ? 2 : 1;
    final double cardItemRatio = size.width > sBP ? 1.5 : 4;
    final bool nextLine = size.width > sBP;
    final bool showCards = size.width > fBP;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Personal Info".toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: listKeys.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisExtent: 50,
                  ),
                  itemBuilder: (context, index) {
                    return SelectableText.rich(
                      TextSpan(
                        text: "${listKeys[index]} : ",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                        children: [
                          TextSpan(
                            text: personalInfoListData[listKeys[index]],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                AnimatedButtonLarge(
                  iconData: Icons.download_rounded,
                  label: "Download CV".toUpperCase(),
                  onPressed: () {
                    try {
                      html.window.open(
                        cvLink,
                        "_blank",
                      );
                    } catch (_) {}
                  },
                  size: const Size(200, 48),
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
          showCards
              ? Expanded(
                  flex: 4,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cardKeys.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: cardItemRatio,
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: mediumGrey.withOpacity(0.5),
                          ),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: personalInfoCardData[cardKeys[index]],
                            style: Theme.of(context).textTheme.titleLarge,
                            children: [
                              TextSpan(
                                text: nextLine ? "+\n" : "+",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w100,
                                    ),
                              ),
                              TextSpan(
                                text: cardKeys[index].toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
