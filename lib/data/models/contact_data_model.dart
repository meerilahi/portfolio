import 'package:portfolio/core/constants/data_fields_constants.dart';

class ContactInfoDataModel {
  final String email;
  final String contactNumber;
  final String githubLink;
  final String websiteLink;
  final String twitterLink;
  final String linkedInLink;

  ContactInfoDataModel({
    required this.email,
    required this.contactNumber,
    required this.githubLink,
    required this.websiteLink,
    required this.twitterLink,
    required this.linkedInLink,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DataFields.email: email,
      DataFields.contactNumber: contactNumber,
      DataFields.githubLink: githubLink,
      DataFields.websiteLink: websiteLink,
      DataFields.twitterLink: twitterLink,
      DataFields.linkedInLink: linkedInLink,
    };
  }

  factory ContactInfoDataModel.fromMap(Map<String, dynamic> map) {
    return ContactInfoDataModel(
      email: map[DataFields.email] as String,
      contactNumber: map[DataFields.contactNumber] as String,
      githubLink: map[DataFields.githubLink] as String,
      websiteLink: map[DataFields.websiteLink] as String,
      twitterLink: map[DataFields.twitterLink] as String,
      linkedInLink: map[DataFields.linkedInLink] as String,
    );
  }

  @override
  String toString() {
    return 'ContactDataModel(email: $email, contactNumber: $contactNumber, githubLink: $githubLink, websiteLink: $websiteLink, twitterLink: $twitterLink, linkedInLink: $linkedInLink)';
  }
}
