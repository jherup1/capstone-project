import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

// Mock getCurrentTimestamp function
Timestamp getCurrentTimestamp() => Timestamp.now();

// Mock random data generator for ticketID
int randomInteger(int min, int max) => min + Random().nextInt(max - min);

Future<void> submitTicket(
  FakeFirebaseFirestore firestore, {
  String? name,
  String? description,
  String? priorityLevel,
  String? status,
  String? imageUrl,
}) async {
  await firestore.collection('supporttickets').add({
    'name': name,
    'description': description,
    'createdTime': getCurrentTimestamp(),
    'priorityLevel': priorityLevel,
    'status': status,
    'lastActive': getCurrentTimestamp(),
    'ticketID': randomInteger(10000, 19999),
  });
}

void main() {
  test('Submit a ticket and verify', () async {
    final firestore = FakeFirebaseFirestore();

    // Call submitTicket with mock data
    await submitTicket(
      firestore,
      name: "Test Name",
      description: "Test Description",
      priorityLevel: "High",
      status: 'Submitted',
    );

    // Fetch and verify the ticket was added
    final querySnapshot = await firestore.collection('supporttickets').get();
    expect(querySnapshot.docs.isNotEmpty,
        isTrue); // Ensure at least one document was added

    final addedTicket = querySnapshot.docs.first.data();
    expect(addedTicket['name'], "Test Name");
    expect(addedTicket['description'], "Test Description");
    expect(addedTicket['priorityLevel'], "High");
    expect(addedTicket['status'], 'Submitted');
    print(addedTicket);
  });
}
