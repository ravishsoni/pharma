import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pharma/data/ProfileDetails.dart';

class ProfileUtils {
  // final _dbRef = FirebaseDatabase.instance;
  final DatabaseReference _ref = FirebaseDatabase.instance.refFromURL("https://pharmaapp-dbaea-default-rtdb.firebaseio.com/");

  Future<void> saveProfile(ProfileDetails profile) async {
    print("Fire data ${profile.toMap()}");
    await _ref.child("profiles").set({
      'name': profile.name,
      'phone': profile.phone,
      'email': profile.email,
      'practitionerId': profile.practitionerId,
      'billingAddress': profile.billingAddress,
      'profilePicUrl': profile.profilePicUrl,
    }).then((value) {
      
    });
  }

  Future<ProfileDetails?> getProfile() async {
    DataSnapshot snapshot = await _ref.child("/profiles").get();
    if (snapshot.exists) {
      return ProfileDetails.fromMap(snapshot.value as Map<dynamic, dynamic>);
    }
    return null;
  }
}
