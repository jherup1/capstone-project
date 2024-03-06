import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  test('Change a user\'s role to admin and verify', () async {
    final firestore = FakeFirebaseFirestore();

    String testUserId = 'akMenLzGgkY1FzzkE7oGYov3PNj1'; // Example UID
    await firestore.collection('users').doc(testUserId).set({
      'created_time': Timestamp.now(),
      'display_name': 'testUser',
      'email': 'test@test.com',
      'last_active_time': Timestamp.now(),
      'last_name': '',
      'phone_number': '',
      'photo_url': null,
      'role': 'user', // Initially, not an admin
      'schools': [],
      'uid': testUserId,
    });

    // Update the user's role to 'admin'
    await firestore.collection('users').doc(testUserId).update({
      'role': 'admin',
    });

    // Fetch and assert to verify the role update
    final DocumentSnapshot userSnapshot =
        await firestore.collection('users').doc(testUserId).get();
    Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

    // Verify the role is now 'admin'
    expect(userData['role'], 'admin');
    print(userData['role']);
  });
}
