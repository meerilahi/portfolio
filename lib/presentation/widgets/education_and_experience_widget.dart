import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/responsive_layout_constants.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/data/models/about_data_model.dart';

class EducationAndExperienceWidget extends StatelessWidget {
  const EducationAndExperienceWidget({
    Key? key,
    required this.eduAndExpDataItems,
  }) : super(key: key);

  final List<EduExpItemModel> eduAndExpDataItems;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final count = size.width > sBP ? 2 : 1;
    final double boxWidth = size.width < fBP
        ? 270
        : size.width < fBP
            ? 400
            : 300;
    final double ratio = size.width < fBP
        ? 2
        : size.width < sBP
            ? 4
            : 2.6;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Column(
        children: [
          Text(
            "Education And Experience".toUpperCase(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 50),
          GridView.builder(
            shrinkWrap: true,
            itemCount: eduAndExpDataItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: ratio,
            ),
            itemBuilder: (context, index) {
              final item = eduAndExpDataItems[index];
              return SizedBox(
                width: boxWidth,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: green,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.school,
                            color: white,
                          ),
                        ),
                        Expanded(
                          child: VerticalDivider(
                            color: mediumGrey.withOpacity(0.5),
                            endIndent: 30,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    Container(
                      constraints: BoxConstraints(maxWidth: boxWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Chip(
                            label: Text(
                              item.period,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 14),
                            ),
                            backgroundColor: lightGrey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side: BorderSide.none,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item.title.toUpperCase(),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
