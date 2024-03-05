import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FavoriteSchoolsRecord extends FirestoreRecord {
  FavoriteSchoolsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "schoolRef" field.
  DocumentReference? _schoolRef;
  DocumentReference? get schoolRef => _schoolRef;
  bool hasSchoolRef() => _schoolRef != null;

  // "schoolName" field.
  String? _schoolName;
  String get schoolName => _schoolName ?? '';
  bool hasSchoolName() => _schoolName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _schoolRef = snapshotData['schoolRef'] as DocumentReference?;
    _schoolName = snapshotData['schoolName'] as String?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favoriteSchools');

  static Stream<FavoriteSchoolsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoriteSchoolsRecord.fromSnapshot(s));

  static Future<FavoriteSchoolsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoriteSchoolsRecord.fromSnapshot(s));

  static FavoriteSchoolsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoriteSchoolsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoriteSchoolsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoriteSchoolsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoriteSchoolsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoriteSchoolsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoriteSchoolsRecordData({
  DocumentReference? schoolRef,
  String? schoolName,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'schoolRef': schoolRef,
      'schoolName': schoolName,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoriteSchoolsRecordDocumentEquality
    implements Equality<FavoriteSchoolsRecord> {
  const FavoriteSchoolsRecordDocumentEquality();

  @override
  bool equals(FavoriteSchoolsRecord? e1, FavoriteSchoolsRecord? e2) {
    return e1?.schoolRef == e2?.schoolRef &&
        e1?.schoolName == e2?.schoolName &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(FavoriteSchoolsRecord? e) =>
      const ListEquality().hash([e?.schoolRef, e?.schoolName, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is FavoriteSchoolsRecord;
}
