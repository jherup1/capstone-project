import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SchoolsRecord extends FirestoreRecord {
  SchoolsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  bool hasLongitude() => _longitude != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "schoolLatLng" field.
  LatLng? _schoolLatLng;
  LatLng? get schoolLatLng => _schoolLatLng;
  bool hasSchoolLatLng() => _schoolLatLng != null;

  void _initializeFields() {
    _latitude = castToType<double>(snapshotData['latitude']);
    _longitude = castToType<double>(snapshotData['longitude']);
    _name = snapshotData['name'] as String?;
    _schoolLatLng = snapshotData['schoolLatLng'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('schools');

  static Stream<SchoolsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SchoolsRecord.fromSnapshot(s));

  static Future<SchoolsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SchoolsRecord.fromSnapshot(s));

  static SchoolsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SchoolsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SchoolsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SchoolsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SchoolsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SchoolsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSchoolsRecordData({
  double? latitude,
  double? longitude,
  String? name,
  LatLng? schoolLatLng,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'name': name,
      'schoolLatLng': schoolLatLng,
    }.withoutNulls,
  );

  return firestoreData;
}

class SchoolsRecordDocumentEquality implements Equality<SchoolsRecord> {
  const SchoolsRecordDocumentEquality();

  @override
  bool equals(SchoolsRecord? e1, SchoolsRecord? e2) {
    return e1?.latitude == e2?.latitude &&
        e1?.longitude == e2?.longitude &&
        e1?.name == e2?.name &&
        e1?.schoolLatLng == e2?.schoolLatLng;
  }

  @override
  int hash(SchoolsRecord? e) => const ListEquality()
      .hash([e?.latitude, e?.longitude, e?.name, e?.schoolLatLng]);

  @override
  bool isValidKey(Object? o) => o is SchoolsRecord;
}
