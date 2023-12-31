import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:portfolio/core/constants/data_fields_constants.dart';
import 'package:portfolio/data/models/about_data_model.dart';
import 'package:portfolio/data/models/contact_data_model.dart';
import 'package:portfolio/data/models/home_data_model.dart';
import 'package:portfolio/data/models/message_data_model.dart';
import 'package:portfolio/data/models/portfolio_data_model.dart';


class FirebaseRepository {
  final dbRef = FirebaseDatabase.instance.ref("Portfolio");
  final stgRef = FirebaseStorage.instance.ref("images");

  Future<HomeDataModel> getHomeData() async {
    final result = await dbRef.child(DataFields.homeName).get();
    final map = result.value as Map<String, dynamic>;
    final String url =
        await stgRef.child(map[DataFields.imageLink]).getDownloadURL();
    map[DataFields.imageLink] = url;
    return HomeDataModel.fromMap(map);
  }

  Future<AboutDataModel> getAboutData() async {
    final result = await dbRef.child(DataFields.aboutName).get();
    final map = result.value as Map<String, dynamic>;
    return AboutDataModel.fromMap(map);
  }

  Future<PortfolioDataModel> getPortfolioData() async {
    final result = await dbRef.child(DataFields.portfolioName).get();
    final list = result.value as List<dynamic>;
    return PortfolioDataModel.fromListOfMap(list);
  }

  Future<ContactInfoDataModel> getContactInfoData() async {
    final result = await dbRef.child(DataFields.contactName).get();
    return ContactInfoDataModel.fromMap(result.value as Map<String, dynamic>);
  }

  Future<bool> sendMessage(MessageDataModel messageDataModel) async {
    try {
      await dbRef
          .child(DataFields.messagesName)
          .push()
          .set(messageDataModel.toMap());
      return true;
    } catch (_) {
      return false;
    }
  }
}
