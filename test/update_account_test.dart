import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateAccountTest(
  FirebaseFirestore firestore,
  String email,
  String firstName,
  String? lastName,
  String? phoneNumber,
  String uid,
) async {
  if (email.isEmpty || firstName.isEmpty) {
    return;
  }
  CollectionReference users = firestore.collection('users');
  await users.doc(uid).update({
    'email': email,
    'display_name': firstName,
    'last_name': lastName,
    'phone_number': phoneNumber,
    'last_active_time': DateTime.now(),
  });
}

void main() {
  test('Update user account details and verify', () async {
    final firestore = FakeFirebaseFirestore();
    final String uid = 'testUserUid';

    // Setup - Ensure the user exists in the fake Firestore
    await firestore.collection('users').doc(uid).set({
      'email': 'oldEmail@example.com',
      'display_name': 'Old Name',
      // other initial fields if necessary
    });

    // Attempt to update the account details
    await updateAccountTest(
      firestore,
      'newEmail@example.com',
      'New First Name',
      'New Last Name',
      '1234567890',
      uid,
    );

    // Fetch and verify the updated user details
    final DocumentSnapshot updatedUserSnapshot =
        await firestore.collection('users').doc(uid).get();
    Map<String, dynamic> updatedUserData =
        updatedUserSnapshot.data() as Map<String, dynamic>;

    // Verify all updated fields match
    expect(updatedUserData['email'], 'newEmail@example.com');
    expect(updatedUserData['display_name'], 'New First Name');
    expect(updatedUserData['last_name'], 'New Last Name');
    expect(updatedUserData['phone_number'], '1234567890');
    print(updatedUserData);
    });
}