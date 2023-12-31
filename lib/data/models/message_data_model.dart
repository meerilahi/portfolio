import 'package:portfolio/core/constants/data_fields_constants.dart';

class MessageDataModel {
  final String name;
  final String email;
  final String subject;
  final String message;
  final DateTime dateTime;

  MessageDataModel({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DataFields.name: name,
      DataFields.email: email,
      DataFields.subject: subject,
      DataFields.message: message,
      DataFields.dateTime: dateTime.millisecondsSinceEpoch,
    };
  }

  factory MessageDataModel.fromMap(Map<String, dynamic> map) {
    return MessageDataModel(
      name: map[DataFields.name] as String,
      email: map[DataFields.email] as String,
      subject: map[DataFields.subject] as String,
      message: map[DataFields.message] as String,
      dateTime:
          DateTime.fromMillisecondsSinceEpoch(map[DataFields.dateTime] as int),
    );
  }
}
