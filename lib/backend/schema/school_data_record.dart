import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SchoolDataRecord extends FirestoreRecord {
  SchoolDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "endowment2018" field.
  String? _endowment2018;
  String get endowment2018 => _endowment2018 ?? '';
  bool hasEndowment2018() => _endowment2018 != null;

  // "academicCalendar" field.
  String? _academicCalendar;
  String get academicCalendar => _academicCalendar ?? '';
  bool hasAcademicCalendar() => _academicCalendar != null;

  // "religiousAffiliation" field.
  String? _religiousAffiliation;
  String get religiousAffiliation => _religiousAffiliation ?? '';
  bool hasReligiousAffiliation() => _religiousAffiliation != null;

  // "schoolType" field.
  List<String>? _schoolType;
  List<String> get schoolType => _schoolType ?? const [];
  bool hasSchoolType() => _schoolType != null;

  // "schoolWebsite" field.
  String? _schoolWebsite;
  String get schoolWebsite => _schoolWebsite ?? '';
  bool hasSchoolWebsite() => _schoolWebsite != null;

  // "setting" field.
  String? _setting;
  String get setting => _setting ?? '';
  bool hasSetting() => _setting != null;

  // "yearFounded" field.
  int? _yearFounded;
  int get yearFounded => _yearFounded ?? 0;
  bool hasYearFounded() => _yearFounded != null;

  void _initializeFields() {
    _endowment2018 = snapshotData['endowment2018'] as String?;
    _academicCalendar = snapshotData['academicCalendar'] as String?;
    _religiousAffiliation = snapshotData['religiousAffiliation'] as String?;
    _schoolType = getDataList(snapshotData['schoolType']);
    _schoolWebsite = snapshotData['schoolWebsite'] as String?;
    _setting = snapshotData['setting'] as String?;
    _yearFounded = castToType<int>(snapshotData['yearFounded']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('schoolData');

  static Stream<SchoolDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SchoolDataRecord.fromSnapshot(s));

  static Future<SchoolDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SchoolDataRecord.fromSnapshot(s));

  static SchoolDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SchoolDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SchoolDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SchoolDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SchoolDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SchoolDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSchoolDataRecordData({
  String? endowment2018,
  String? academicCalendar,
  String? religiousAffiliation,
  String? schoolWebsite,
  String? setting,
  int? yearFounded,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'endowment2018': endowment2018,
      'academicCalendar': academicCalendar,
      'religiousAffiliation': religiousAffiliation,
      'schoolWebsite': schoolWebsite,
      'setting': setting,
      'yearFounded': yearFounded,
    }.withoutNulls,
  );

  return firestoreData;
}

class SchoolDataRecordDocumentEquality implements Equality<SchoolDataRecord> {
  const SchoolDataRecordDocumentEquality();

  @override
  bool equals(SchoolDataRecord? e1, SchoolDataRecord? e2) {
    const listEquality = ListEquality();
    return e1?.endowment2018 == e2?.endowment2018 &&
        e1?.academicCalendar == e2?.academicCalendar &&
        e1?.religiousAffiliation == e2?.religiousAffiliation &&
        listEquality.equals(e1?.schoolType, e2?.schoolType) &&
        e1?.schoolWebsite == e2?.schoolWebsite &&
        e1?.setting == e2?.setting &&
        e1?.yearFounded == e2?.yearFounded;
  }

  @override
  int hash(SchoolDataRecord? e) => const ListEquality().hash([
        e?.endowment2018,
        e?.academicCalendar,
        e?.religiousAffiliation,
        e?.schoolType,
        e?.schoolWebsite,
        e?.setting,
        e?.yearFounded
      ]);

  @override
  bool isValidKey(Object? o) => o is SchoolDataRecord;
}
