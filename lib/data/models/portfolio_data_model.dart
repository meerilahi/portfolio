import 'package:portfolio/core/constants/data_fields_constants.dart';

class PortfolioItem {
  final String name;
  final String imageLink;
  final String webLink;
  final String techStack;
  final String clientName;
  final String clientContact;

  PortfolioItem({
    required this.name,
    required this.imageLink,
    required this.webLink,
    required this.techStack,
    required this.clientName,
    required this.clientContact,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DataFields.name: name,
      DataFields.imageLink: imageLink,
      DataFields.webLink: webLink,
      DataFields.techStack: techStack,
      DataFields.clientName: clientName,
      DataFields.clientContact: clientContact,
    };
  }

  factory PortfolioItem.fromMap(Map<String, dynamic> map) {
    return PortfolioItem(
      name: map[DataFields.name] as String,
      imageLink: map[DataFields.imageLink] as String,
      webLink: map[DataFields.webLink] as String,
      techStack: map[DataFields.techStack] as String,
      clientName: map[DataFields.clientName] as String,
      clientContact: map[DataFields.clientContact] as String,
    );
  }

  @override
  String toString() {
    return 'PortfolioItem(name: $name, imageLink: $imageLink, webLink: $webLink, techStack: $techStack, clientName: $clientName, clientContact: $clientContact)';
  }
}

class PortfolioDataModel {
  final List<PortfolioItem> portfolioItems;

  PortfolioDataModel({required this.portfolioItems});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DataFields.portfolioItems: portfolioItems.map((x) => x.toMap()).toList(),
    };
  }

  factory PortfolioDataModel.fromListOfMap(List<dynamic> map) {
    return PortfolioDataModel(
      portfolioItems: map.map((x) {
        return PortfolioItem.fromMap(x as Map<String, dynamic>);
      }).toList(),
    );
  }

  @override
  String toString() => 'PortfolioDataModel(portfolioItems: $portfolioItems)';
}
