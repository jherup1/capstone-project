import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramDataRecord extends FirestoreRecord {
  ProgramDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "programName" field.
  String? _programName;
  String get programName => _programName ?? '';
  bool hasProgramName() => _programName != null;

  // "programDescription" field.
  String? _programDescription;
  String get programDescription => _programDescription ?? '';
  bool hasProgramDescription() => _programDescription != null;

  // "programImage" field.
  String? _programImage;
  String get programImage => _programImage ?? '';
  bool hasProgramImage() => _programImage != null;

  // "programWebsite" field.
  String? _programWebsite;
  String get programWebsite => _programWebsite ?? '';
  bool hasProgramWebsite() => _programWebsite != null;

  // "programJobs" field.
  String? _programJobs;
  String get programJobs => _programJobs ?? '';
  bool hasProgramJobs() => _programJobs != null;

  // "schoolRef" field.
  List<DocumentReference>? _schoolRef;
  List<DocumentReference> get schoolRef => _schoolRef ?? const [];
  bool hasSchoolRef() => _schoolRef != null;

  void _initializeFields() {
    _programName = snapshotData['programName'] as String?;
    _programDescription = snapshotData['programDescription'] as String?;
    _programImage = snapshotData['programImage'] as String?;
    _programWebsite = snapshotData['programWebsite'] as String?;
    _programJobs = snapshotData['programJobs'] as String?;
    _schoolRef = getDataList(snapshotData['schoolRef']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('programData');

  static Stream<ProgramDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProgramDataRecord.fromSnapshot(s));

  static Future<ProgramDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProgramDataRecord.fromSnapshot(s));

  static ProgramDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProgramDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProgramDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProgramDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProgramDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProgramDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProgramDataRecordData({
  String? programName,
  String? programDescription,
  String? programImage,
  String? programWebsite,
  String? programJobs,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'programName': programName,
      'programDescription': programDescription,
      'programImage': programImage,
      'programWebsite': programWebsite,
      'programJobs': programJobs,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProgramDataRecordDocumentEquality implements Equality<ProgramDataRecord> {
  const ProgramDataRecordDocumentEquality();

  @override
  bool equals(ProgramDataRecord? e1, ProgramDataRecord? e2) {
    const listEquality = ListEquality();
    return e1?.programName == e2?.programName &&
        e1?.programDescription == e2?.programDescription &&
        e1?.programImage == e2?.programImage &&
        e1?.programWebsite == e2?.programWebsite &&
        e1?.programJobs == e2?.programJobs &&
        listEquality.equals(e1?.schoolRef, e2?.schoolRef);
  }

  @override
  int hash(ProgramDataRecord? e) => const ListEquality().hash([
        e?.programName,
        e?.programDescription,
        e?.programImage,
        e?.programWebsite,
        e?.programJobs,
        e?.schoolRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ProgramDataRecord;
}
