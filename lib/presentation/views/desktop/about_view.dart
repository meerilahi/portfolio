import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/responsive_layout_constants.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/data/models/about_data_model.dart';
import 'package:portfolio/data/repo/repository.dart';
import 'package:portfolio/presentation/widgets/drawer.dart';
import 'package:portfolio/presentation/widgets/education_and_experience_widget.dart';
import 'package:portfolio/presentation/widgets/my_skills_widget.dart';
import 'package:portfolio/presentation/widgets/nav_buttons_desktop_widget.dart';
import 'package:portfolio/presentation/widgets/personal_info_desktop_widget.dart';
import 'package:provider/provider.dart';

class AboutViewDesktop extends StatelessWidget {
  const AboutViewDesktop({
    Key? key,
    required this.currentRouteName,
  }) : super(key: key);
  final String currentRouteName;
  @override
  Widget build(BuildContext context) {
    final bool phone = MediaQuery.of(context).size.width < fBP;
    return Scaffold(
      backgroundColor: white,
      drawer: drawer(context, currentRouteName),
      body: Stack(
        children: [
          FutureBuilder<AboutDataModel>(
              future: Provider.of<FirebaseRepository>(context).getAboutData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.done:
                    final data = snapshot.data;
                    if (data == null) {
                      return const Center(child: Text("No data to show"));
                    }
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 100),
                          RichText(
                            text: TextSpan(
                              text: "About ".toUpperCase(),
                              style: Theme.of(context).textTheme.headlineLarge,
                              children: [
                                TextSpan(
                                  text: "Me".toUpperCase(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 100),
                          PersonalInfoWidget(
                            personalInfoCardData: data.personalInfoCardData,
                            personalInfoListData: data.personalInfoListData,
                            cvLink: data.cvLink,
                          ),
                          const SizedBox(height: 50),
                          Divider(
                            color: mediumGrey.withOpacity(0.5),
                            endIndent: 400,
                            indent: 400,
                          ),
                          const SizedBox(height: 50),
                          MySkillsWidget(
                            mySkillsData: data.mySkillsData.map(
                              (key, value) => MapEntry(
                                key,
                                double.tryParse(value) ?? 0.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          Divider(
                            color: mediumGrey.withOpacity(0.5),
                            endIndent: 400,
                            indent: 400,
                          ),
                          const SizedBox(height: 60),
                          EducationAndExperienceWidget(
                            eduAndExpDataItems: data.myEduAndExpData,
                          ),
                          const SizedBox(height: 80),
                        ],
                      ),
                    );
                  default:
                    return const Center(child: Text("Unable to load data"));
                }
              }),
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
