import 'package:portfolio/core/constants/data_fields_constants.dart';

class EduExpItemModel {
  final String period;
  final String title;
  final String description;

  EduExpItemModel({
    required this.period,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DataFields.period: period,
      DataFields.title: title,
      DataFields.description: description,
    };
  }

  factory EduExpItemModel.fromMap(Map<String, dynamic> map) {
    return EduExpItemModel(
      period: map[DataFields.period] as String,
      title: map[DataFields.title] as String,
      description: map[DataFields.description] as String,
    );
  }

  @override
  String toString() =>
      'EduExpItemModel(period: $period, title: $title, description: $description)';
}

class AboutDataModel {
  final Map<String, String> personalInfoListData;
  final Map<String, String> personalInfoCardData;
  final String cvLink;
  final Map<String, String> mySkillsData;
  final List<EduExpItemModel> myEduAndExpData;

  AboutDataModel({
    required this.personalInfoListData,
    required this.personalInfoCardData,
    required this.cvLink,
    required this.mySkillsData,
    required this.myEduAndExpData,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DataFields.personalInfoListData: personalInfoListData,
      DataFields.personalInfoCardData: personalInfoCardData,
      DataFields.cvLink: cvLink,
      DataFields.mySkillsData: mySkillsData,
      DataFields.myEduAndExpData: myEduAndExpData.map((e) => e.toMap())
    };
  }

  factory AboutDataModel.fromMap(Map<String, dynamic> map) {
    return AboutDataModel(
      personalInfoListData: Map<String, String>.from(
        (map[DataFields.personalInfoListData] as Map<String, dynamic>),
      ),
      personalInfoCardData: Map<String, String>.from(
        (map[DataFields.personalInfoCardData] as Map<String, dynamic>),
      ),
      cvLink: map[DataFields.cvLink] as String,
      mySkillsData: Map<String, String>.from(
        (map[DataFields.mySkillsData] as Map<String, dynamic>),
      ),
      myEduAndExpData: (map[DataFields.myEduAndExpData] as List<dynamic>)
          .map((e) => EduExpItemModel.fromMap(e))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'AboutDataModel(personalInfoListData: $personalInfoListData, personalInfoCardData: $personalInfoCardData, cvLink: $cvLink, mySkillsData: $mySkillsData, myEduAndExpData: $myEduAndExpData)';
  }
}
