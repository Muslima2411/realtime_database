import 'package:firebase_database/firebase_database.dart';

class RTDBService {
  static DatabaseReference ref = FirebaseDatabase.instance.ref();
  static String path = "Notes";

  static Future<void> storeData({required Map<String, dynamic> data}) async {
    String? key = ref.child(path).push().key;
    await ref.child(path).child(key!).set(data);
  }

  static Future<void> readData() async {
    String? key = ref.child(path).push().key;
    DataSnapshot dataSnapshot = await ref.child(path).child(key!).get();
    print(dataSnapshot.value);
  }
}
