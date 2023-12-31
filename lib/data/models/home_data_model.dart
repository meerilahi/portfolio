import 'package:portfolio/core/constants/data_fields_constants.dart';

class HomeDataModel {
  final String name;
  final String role;
  final String introPara;
  final String? imageLink;

  HomeDataModel({
    required this.name,
    required this.role,
    required this.introPara,
    required this.imageLink,
  });

  factory HomeDataModel.fromMap(Map<String, dynamic> map) {
    return HomeDataModel(
      name: map[DataFields.name] as String? ?? "null",
      role: map[DataFields.role] as String? ?? "null",
      introPara: map[DataFields.introPara] as String? ?? "null",
      imageLink: map[DataFields.imageLink] as String?,
    );
  }

  @override
  String toString() {
    return 'HomeDataModel(name: $name, role: $role, introPara: $introPara, imageLink: $imageLink)';
  }
}
