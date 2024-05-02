import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupportStatsRecord extends FirestoreRecord {
  SupportStatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "numTickets" field.
  int? _numTickets;
  int get numTickets => _numTickets ?? 0;
  bool hasNumTickets() => _numTickets != null;

  // "lastResolved" field.
  DateTime? _lastResolved;
  DateTime? get lastResolved => _lastResolved;
  bool hasLastResolved() => _lastResolved != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _numTickets = castToType<int>(snapshotData['numTickets']);
    _lastResolved = snapshotData['lastResolved'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('supportStats');

  static Stream<SupportStatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupportStatsRecord.fromSnapshot(s));

  static Future<SupportStatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SupportStatsRecord.fromSnapshot(s));

  static SupportStatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SupportStatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupportStatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupportStatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SupportStatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupportStatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupportStatsRecordData({
  int? numTickets,
  DateTime? lastResolved,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'numTickets': numTickets,
      'lastResolved': lastResolved,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupportStatsRecordDocumentEquality
    implements Equality<SupportStatsRecord> {
  const SupportStatsRecordDocumentEquality();

  @override
  bool equals(SupportStatsRecord? e1, SupportStatsRecord? e2) {
    return e1?.numTickets == e2?.numTickets &&
        e1?.lastResolved == e2?.lastResolved &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(SupportStatsRecord? e) =>
      const ListEquality().hash([e?.numTickets, e?.lastResolved, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is SupportStatsRecord;
}
