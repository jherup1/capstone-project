import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RankingRecord extends FirestoreRecord {
  RankingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "displayRank" field.
  String? _displayRank;
  String get displayRank => _displayRank ?? '';
  bool hasDisplayRank() => _displayRank != null;

  // "isTied" field.
  bool? _isTied;
  bool get isTied => _isTied ?? false;
  bool hasIsTied() => _isTied != null;

  // "sortRank" field.
  int? _sortRank;
  int get sortRank => _sortRank ?? 0;
  bool hasSortRank() => _sortRank != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _displayRank = snapshotData['displayRank'] as String?;
    _isTied = snapshotData['isTied'] as bool?;
    _sortRank = castToType<int>(snapshotData['sortRank']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ranking')
          : FirebaseFirestore.instance.collectionGroup('ranking');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ranking').doc(id);

  static Stream<RankingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RankingRecord.fromSnapshot(s));

  static Future<RankingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RankingRecord.fromSnapshot(s));

  static RankingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RankingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RankingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RankingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RankingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RankingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRankingRecordData({
  String? displayRank,
  bool? isTied,
  int? sortRank,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'displayRank': displayRank,
      'isTied': isTied,
      'sortRank': sortRank,
    }.withoutNulls,
  );

  return firestoreData;
}

class RankingRecordDocumentEquality implements Equality<RankingRecord> {
  const RankingRecordDocumentEquality();

  @override
  bool equals(RankingRecord? e1, RankingRecord? e2) {
    return e1?.displayRank == e2?.displayRank &&
        e1?.isTied == e2?.isTied &&
        e1?.sortRank == e2?.sortRank;
  }

  @override
  int hash(RankingRecord? e) =>
      const ListEquality().hash([e?.displayRank, e?.isTied, e?.sortRank]);

  @override
  bool isValidKey(Object? o) => o is RankingRecord;
}
