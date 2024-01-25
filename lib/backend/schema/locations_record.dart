import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationsRecord extends FirestoreRecord {
  LocationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "addressLatLong" field.
  LatLng? _addressLatLong;
  LatLng? get addressLatLong => _addressLatLong;
  bool hasAddressLatLong() => _addressLatLong != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "zipcode" field.
  String? _zipcode;
  String get zipcode => _zipcode ?? '';
  bool hasZipcode() => _zipcode != null;

  // "addressID" field.
  String? _addressID;
  String get addressID => _addressID ?? '';
  bool hasAddressID() => _addressID != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "streetAddress" field.
  String? _streetAddress;
  String get streetAddress => _streetAddress ?? '';
  bool hasStreetAddress() => _streetAddress != null;

  void _initializeFields() {
    _addressLatLong = snapshotData['addressLatLong'] as LatLng?;
    _city = snapshotData['city'] as String?;
    _zipcode = snapshotData['zipcode'] as String?;
    _addressID = snapshotData['addressID'] as String?;
    _userID = snapshotData['userID'] as String?;
    _streetAddress = snapshotData['streetAddress'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('locations');

  static Stream<LocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocationsRecord.fromSnapshot(s));

  static Future<LocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocationsRecord.fromSnapshot(s));

  static LocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocationsRecordData({
  LatLng? addressLatLong,
  String? city,
  String? zipcode,
  String? addressID,
  String? userID,
  String? streetAddress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'addressLatLong': addressLatLong,
      'city': city,
      'zipcode': zipcode,
      'addressID': addressID,
      'userID': userID,
      'streetAddress': streetAddress,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocationsRecordDocumentEquality implements Equality<LocationsRecord> {
  const LocationsRecordDocumentEquality();

  @override
  bool equals(LocationsRecord? e1, LocationsRecord? e2) {
    return e1?.addressLatLong == e2?.addressLatLong &&
        e1?.city == e2?.city &&
        e1?.zipcode == e2?.zipcode &&
        e1?.addressID == e2?.addressID &&
        e1?.userID == e2?.userID &&
        e1?.streetAddress == e2?.streetAddress;
  }

  @override
  int hash(LocationsRecord? e) => const ListEquality().hash([
        e?.addressLatLong,
        e?.city,
        e?.zipcode,
        e?.addressID,
        e?.userID,
        e?.streetAddress
      ]);

  @override
  bool isValidKey(Object? o) => o is LocationsRecord;
}
