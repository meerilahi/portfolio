import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/responsive_layout_constants.dart';
import 'package:portfolio/core/theme/colors.dart';

class MySkillsWidget extends StatelessWidget {
  const MySkillsWidget({
    Key? key,
    required this.mySkillsData,
  }) : super(key: key);

  final Map<String, double> mySkillsData;

  @override
  Widget build(BuildContext context) {
    final skillKeys = mySkillsData.keys.toList();
    final size = MediaQuery.of(context).size;
    final itemSize = size.width > sBP ? 130.0 : 85.0;
    final count = size.width < fBP - 160
        ? 2
        : size.width < fBP - 20
            ? 3
            : 4;
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 1100,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Text(
            "My Skills".toUpperCase(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            itemCount: skillKeys.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              crossAxisCount: count,
            ),
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: itemSize,
                      height: itemSize,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: CircularProgressIndicator(
                              value: mySkillsData[skillKeys[index]],
                              color: green,
                              backgroundColor: lightGrey,
                              strokeWidth: 10,
                            ),
                          ),
                          Center(
                              child: Text(
                            "${mySkillsData[skillKeys[index]]! * 100}%",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ))
                        ],
                      ),
                    ),
                    Text(
                      skillKeys[index],
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
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
