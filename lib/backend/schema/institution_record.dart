import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstitutionRecord extends FirestoreRecord {
  InstitutionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "countryCode" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  bool hasCountryCode() => _countryCode != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "displayName" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "institutionalControl" field.
  String? _institutionalControl;
  String get institutionalControl => _institutionalControl ?? '';
  bool hasInstitutionalControl() => _institutionalControl != null;

  // "isPublic" field.
  bool? _isPublic;
  bool get isPublic => _isPublic ?? false;
  bool hasIsPublic() => _isPublic != null;

  // "primaryPhotoCard" field.
  String? _primaryPhotoCard;
  String get primaryPhotoCard => _primaryPhotoCard ?? '';
  bool hasPrimaryPhotoCard() => _primaryPhotoCard != null;

  // "schoolType" field.
  String? _schoolType;
  String get schoolType => _schoolType ?? '';
  bool hasSchoolType() => _schoolType != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "zip" field.
  int? _zip;
  int get zip => _zip ?? 0;
  bool hasZip() => _zip != null;

  // "mygeopoint" field.
  LatLng? _mygeopoint;
  LatLng? get mygeopoint => _mygeopoint;
  bool hasMygeopoint() => _mygeopoint != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _address = snapshotData['address'] as String?;
    _city = snapshotData['city'] as String?;
    _countryCode = snapshotData['countryCode'] as String?;
    _description = snapshotData['description'] as String?;
    _displayName = snapshotData['displayName'] as String?;
    _institutionalControl = snapshotData['institutionalControl'] as String?;
    _isPublic = snapshotData['isPublic'] as bool?;
    _primaryPhotoCard = snapshotData['primaryPhotoCard'] as String?;
    _schoolType = snapshotData['schoolType'] as String?;
    _state = snapshotData['state'] as String?;
    _zip = castToType<int>(snapshotData['zip']);
    _mygeopoint = snapshotData['mygeopoint'] as LatLng?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('institution')
          : FirebaseFirestore.instance.collectionGroup('institution');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('institution').doc(id);

  static Stream<InstitutionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InstitutionRecord.fromSnapshot(s));

  static Future<InstitutionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InstitutionRecord.fromSnapshot(s));

  static InstitutionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InstitutionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InstitutionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InstitutionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InstitutionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InstitutionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInstitutionRecordData({
  String? address,
  String? city,
  String? countryCode,
  String? description,
  String? displayName,
  String? institutionalControl,
  bool? isPublic,
  String? primaryPhotoCard,
  String? schoolType,
  String? state,
  int? zip,
  LatLng? mygeopoint,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address': address,
      'city': city,
      'countryCode': countryCode,
      'description': description,
      'displayName': displayName,
      'institutionalControl': institutionalControl,
      'isPublic': isPublic,
      'primaryPhotoCard': primaryPhotoCard,
      'schoolType': schoolType,
      'state': state,
      'zip': zip,
      'mygeopoint': mygeopoint,
    }.withoutNulls,
  );

  return firestoreData;
}

class InstitutionRecordDocumentEquality implements Equality<InstitutionRecord> {
  const InstitutionRecordDocumentEquality();

  @override
  bool equals(InstitutionRecord? e1, InstitutionRecord? e2) {
    return e1?.address == e2?.address &&
        e1?.city == e2?.city &&
        e1?.countryCode == e2?.countryCode &&
        e1?.description == e2?.description &&
        e1?.displayName == e2?.displayName &&
        e1?.institutionalControl == e2?.institutionalControl &&
        e1?.isPublic == e2?.isPublic &&
        e1?.primaryPhotoCard == e2?.primaryPhotoCard &&
        e1?.schoolType == e2?.schoolType &&
        e1?.state == e2?.state &&
        e1?.zip == e2?.zip &&
        e1?.mygeopoint == e2?.mygeopoint;
  }

  @override
  int hash(InstitutionRecord? e) => const ListEquality().hash([
        e?.address,
        e?.city,
        e?.countryCode,
        e?.description,
        e?.displayName,
        e?.institutionalControl,
        e?.isPublic,
        e?.primaryPhotoCard,
        e?.schoolType,
        e?.state,
        e?.zip,
        e?.mygeopoint
      ]);

  @override
  bool isValidKey(Object? o) => o is InstitutionRecord;
}
