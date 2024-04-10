import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackRecord extends FirestoreRecord {
  FeedbackRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "reviewDescription" field.
  String? _reviewDescription;
  String get reviewDescription => _reviewDescription ?? '';
  bool hasReviewDescription() => _reviewDescription != null;

  // "reviewNumber" field.
  int? _reviewNumber;
  int get reviewNumber => _reviewNumber ?? 0;
  bool hasReviewNumber() => _reviewNumber != null;

  // "submissionDate" field.
  DateTime? _submissionDate;
  DateTime? get submissionDate => _submissionDate;
  bool hasSubmissionDate() => _submissionDate != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _reviewDescription = snapshotData['reviewDescription'] as String?;
    _reviewNumber = castToType<int>(snapshotData['reviewNumber']);
    _submissionDate = snapshotData['submissionDate'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedback');

  static Stream<FeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackRecord.fromSnapshot(s));

  static Future<FeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbackRecord.fromSnapshot(s));

  static FeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackRecordData({
  String? reviewDescription,
  int? reviewNumber,
  DateTime? submissionDate,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reviewDescription': reviewDescription,
      'reviewNumber': reviewNumber,
      'submissionDate': submissionDate,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbackRecordDocumentEquality implements Equality<FeedbackRecord> {
  const FeedbackRecordDocumentEquality();

  @override
  bool equals(FeedbackRecord? e1, FeedbackRecord? e2) {
    return e1?.reviewDescription == e2?.reviewDescription &&
        e1?.reviewNumber == e2?.reviewNumber &&
        e1?.submissionDate == e2?.submissionDate &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(FeedbackRecord? e) => const ListEquality()
      .hash([e?.reviewDescription, e?.reviewNumber, e?.submissionDate, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is FeedbackRecord;
}
