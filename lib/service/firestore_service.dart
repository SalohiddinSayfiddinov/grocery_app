import 'package:zakaz/service/firebase_firestore.dart';

class AddDataToFirestore {
  static Map<String, dynamic> mapim = {
    "joinedTime": "",
  };

  static Future addDataToFirestore(String collection, String id) async {
    try {
      await Firestore.firestore.collection(collection).doc(id).set(mapim);
    } catch (e) {
      print("ERROR: $e");
    }
  }

  static Future updateData(String collection, String id, data) async {
    try {
      await Firestore.firestore
          .collection("users")
          .doc(id)
          .update({"cart": ""});
    } catch (e) {
      print("ERROR: $e");
    }
  }

  static Future queryData(String queryString) async {
    return Firestore.firestore
        .collection('goods')
        .where("name", isGreaterThanOrEqualTo: queryString)
        .get();
  }
}
