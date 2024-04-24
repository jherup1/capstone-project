import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Add a favorite school to a user and verify',
      () async {
    final firestore = FakeFirebaseFirestore();
    final String userId = 'LPaTwJga5vVBhoHdIKzZ2QzDjZ13';
    final String schoolId = '000qnimI2R9Sxv2WpfEk';

    // Setup - Ensure the user exists in the fake Firestore
    await firestore.collection('users').doc(userId).set({
      'schools': [],
    });

    // Logic adapted to use schoolId instead of DocumentReference
    await firestore.collection('users').doc(userId).update({
      'schools': FieldValue.arrayUnion([schoolId])
    });

    // Verification - Fetch the updated user document and verify the school addition
    final DocumentSnapshot updatedUserSnapshot =
        await firestore.collection('users').doc(userId).get();
    List<dynamic> updatedSchools = updatedUserSnapshot.get('schools');

    // The schoolId should be in the user's schools list
    expect(updatedSchools.length, 1); // Assert the schools array is not empty
    expect(updatedSchools.contains(schoolId),
        isTrue); // Assert the schoolId was added
    print(updatedSchools);
  });
}