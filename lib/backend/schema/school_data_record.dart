import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SchoolDataRecord extends FirestoreRecord {
  SchoolDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "academicCalendar" field.
  String? _academicCalendar;
  String get academicCalendar => _academicCalendar ?? '';
  bool hasAcademicCalendar() => _academicCalendar != null;

  // "acceptanceRate" field.
  double? _acceptanceRate;
  double get acceptanceRate => _acceptanceRate ?? 0.0;
  bool hasAcceptanceRate() => _acceptanceRate != null;

  // "actAvg" field.
  int? _actAvg;
  int get actAvg => _actAvg ?? 0;
  bool hasActAvg() => _actAvg != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "aliasNames" field.
  String? _aliasNames;
  String get aliasNames => _aliasNames ?? '';
  bool hasAliasNames() => _aliasNames != null;

  // "businessRepScore" field.
  double? _businessRepScore;
  double get businessRepScore => _businessRepScore ?? 0.0;
  bool hasBusinessRepScore() => _businessRepScore != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "costAfterAid" field.
  double? _costAfterAid;
  double get costAfterAid => _costAfterAid ?? 0.0;
  bool hasCostAfterAid() => _costAfterAid != null;

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

  // "endowment2018" field.
  String? _endowment2018;
  String get endowment2018 => _endowment2018 ?? '';
  bool hasEndowment2018() => _endowment2018 != null;

  // "engineeringRepScore" field.
  double? _engineeringRepScore;
  double get engineeringRepScore => _engineeringRepScore ?? 0.0;
  bool hasEngineeringRepScore() => _engineeringRepScore != null;

  // "enrollment" field.
  int? _enrollment;
  int get enrollment => _enrollment ?? 0;
  bool hasEnrollment() => _enrollment != null;

  // "geoPoint" field.
  LatLng? _geoPoint;
  LatLng? get geoPoint => _geoPoint;
  bool hasGeoPoint() => _geoPoint != null;

  // "hsGpaAvg" field.
  double? _hsGpaAvg;
  double get hsGpaAvg => _hsGpaAvg ?? 0.0;
  bool hasHsGpaAvg() => _hsGpaAvg != null;

  // "institutionalControl" field.
  String? _institutionalControl;
  String get institutionalControl => _institutionalControl ?? '';
  bool hasInstitutionalControl() => _institutionalControl != null;

  // "isPublic" field.
  bool? _isPublic;
  bool get isPublic => _isPublic ?? false;
  bool hasIsPublic() => _isPublic != null;

  // "percentReceivingAId" field.
  double? _percentReceivingAId;
  double get percentReceivingAId => _percentReceivingAId ?? 0.0;
  bool hasPercentReceivingAId() => _percentReceivingAId != null;

  // "rankingDisplayRank" field.
  String? _rankingDisplayRank;
  String get rankingDisplayRank => _rankingDisplayRank ?? '';
  bool hasRankingDisplayRank() => _rankingDisplayRank != null;

  // "rankingIsTied" field.
  bool? _rankingIsTied;
  bool get rankingIsTied => _rankingIsTied ?? false;
  bool hasRankingIsTied() => _rankingIsTied != null;

  // "rankingSortRank" field.
  int? _rankingSortRank;
  int get rankingSortRank => _rankingSortRank ?? 0;
  bool hasRankingSortRank() => _rankingSortRank != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  bool hasRegion() => _region != null;

  // "religiousAffiliation" field.
  String? _religiousAffiliation;
  String get religiousAffiliation => _religiousAffiliation ?? '';
  bool hasReligiousAffiliation() => _religiousAffiliation != null;

  // "satActRangeACT" field.
  String? _satActRangeACT;
  String get satActRangeACT => _satActRangeACT ?? '';
  bool hasSatActRangeACT() => _satActRangeACT != null;

  // "satActRangeSAT" field.
  String? _satActRangeSAT;
  String get satActRangeSAT => _satActRangeSAT ?? '';
  bool hasSatActRangeSAT() => _satActRangeSAT != null;

  // "satAvg" field.
  int? _satAvg;
  int get satAvg => _satAvg ?? 0;
  bool hasSatAvg() => _satAvg != null;

  // "schoolType" field.
  String? _schoolType;
  String get schoolType => _schoolType ?? '';
  bool hasSchoolType() => _schoolType != null;

  // "schoolTypeNationalUniversities" field.
  String? _schoolTypeNationalUniversities;
  String get schoolTypeNationalUniversities =>
      _schoolTypeNationalUniversities ?? '';
  bool hasSchoolTypeNationalUniversities() =>
      _schoolTypeNationalUniversities != null;

  // "schoolWebsite" field.
  String? _schoolWebsite;
  String get schoolWebsite => _schoolWebsite ?? '';
  bool hasSchoolWebsite() => _schoolWebsite != null;

  // "setting" field.
  String? _setting;
  String get setting => _setting ?? '';
  bool hasSetting() => _setting != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "tuition" field.
  int? _tuition;
  int get tuition => _tuition ?? 0;
  bool hasTuition() => _tuition != null;

  // "yearFounded" field.
  int? _yearFounded;
  int get yearFounded => _yearFounded ?? 0;
  bool hasYearFounded() => _yearFounded != null;

  // "zip" field.
  int? _zip;
  int get zip => _zip ?? 0;
  bool hasZip() => _zip != null;

  // "primaryPhoto" field.
  String? _primaryPhoto;
  String get primaryPhoto => _primaryPhoto ?? '';
  bool hasPrimaryPhoto() => _primaryPhoto != null;

  // "programRef" field.
  List<DocumentReference>? _programRef;
  List<DocumentReference> get programRef => _programRef ?? const [];
  bool hasProgramRef() => _programRef != null;

  void _initializeFields() {
    _academicCalendar = snapshotData['academicCalendar'] as String?;
    _acceptanceRate = castToType<double>(snapshotData['acceptanceRate']);
    _actAvg = castToType<int>(snapshotData['actAvg']);
    _address = snapshotData['address'] as String?;
    _aliasNames = snapshotData['aliasNames'] as String?;
    _businessRepScore = castToType<double>(snapshotData['businessRepScore']);
    _city = snapshotData['city'] as String?;
    _costAfterAid = castToType<double>(snapshotData['costAfterAid']);
    _countryCode = snapshotData['countryCode'] as String?;
    _description = snapshotData['description'] as String?;
    _displayName = snapshotData['displayName'] as String?;
    _endowment2018 = snapshotData['endowment2018'] as String?;
    _engineeringRepScore =
        castToType<double>(snapshotData['engineeringRepScore']);
    _enrollment = castToType<int>(snapshotData['enrollment']);
    _geoPoint = snapshotData['geoPoint'] as LatLng?;
    _hsGpaAvg = castToType<double>(snapshotData['hsGpaAvg']);
    _institutionalControl = snapshotData['institutionalControl'] as String?;
    _isPublic = snapshotData['isPublic'] as bool?;
    _percentReceivingAId =
        castToType<double>(snapshotData['percentReceivingAId']);
    _rankingDisplayRank = snapshotData['rankingDisplayRank'] as String?;
    _rankingIsTied = snapshotData['rankingIsTied'] as bool?;
    _rankingSortRank = castToType<int>(snapshotData['rankingSortRank']);
    _region = snapshotData['region'] as String?;
    _religiousAffiliation = snapshotData['religiousAffiliation'] as String?;
    _satActRangeACT = snapshotData['satActRangeACT'] as String?;
    _satActRangeSAT = snapshotData['satActRangeSAT'] as String?;
    _satAvg = castToType<int>(snapshotData['satAvg']);
    _schoolType = snapshotData['schoolType'] as String?;
    _schoolTypeNationalUniversities =
        snapshotData['schoolTypeNationalUniversities'] as String?;
    _schoolWebsite = snapshotData['schoolWebsite'] as String?;
    _setting = snapshotData['setting'] as String?;
    _state = snapshotData['state'] as String?;
    _tuition = castToType<int>(snapshotData['tuition']);
    _yearFounded = castToType<int>(snapshotData['yearFounded']);
    _zip = castToType<int>(snapshotData['zip']);
    _primaryPhoto = snapshotData['primaryPhoto'] as String?;
    _programRef = getDataList(snapshotData['programRef']);
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
  String? academicCalendar,
  double? acceptanceRate,
  int? actAvg,
  String? address,
  String? aliasNames,
  double? businessRepScore,
  String? city,
  double? costAfterAid,
  String? countryCode,
  String? description,
  String? displayName,
  String? endowment2018,
  double? engineeringRepScore,
  int? enrollment,
  LatLng? geoPoint,
  double? hsGpaAvg,
  String? institutionalControl,
  bool? isPublic,
  double? percentReceivingAId,
  String? rankingDisplayRank,
  bool? rankingIsTied,
  int? rankingSortRank,
  String? region,
  String? religiousAffiliation,
  String? satActRangeACT,
  String? satActRangeSAT,
  int? satAvg,
  String? schoolType,
  String? schoolTypeNationalUniversities,
  String? schoolWebsite,
  String? setting,
  String? state,
  int? tuition,
  int? yearFounded,
  int? zip,
  String? primaryPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'academicCalendar': academicCalendar,
      'acceptanceRate': acceptanceRate,
      'actAvg': actAvg,
      'address': address,
      'aliasNames': aliasNames,
      'businessRepScore': businessRepScore,
      'city': city,
      'costAfterAid': costAfterAid,
      'countryCode': countryCode,
      'description': description,
      'displayName': displayName,
      'endowment2018': endowment2018,
      'engineeringRepScore': engineeringRepScore,
      'enrollment': enrollment,
      'geoPoint': geoPoint,
      'hsGpaAvg': hsGpaAvg,
      'institutionalControl': institutionalControl,
      'isPublic': isPublic,
      'percentReceivingAId': percentReceivingAId,
      'rankingDisplayRank': rankingDisplayRank,
      'rankingIsTied': rankingIsTied,
      'rankingSortRank': rankingSortRank,
      'region': region,
      'religiousAffiliation': religiousAffiliation,
      'satActRangeACT': satActRangeACT,
      'satActRangeSAT': satActRangeSAT,
      'satAvg': satAvg,
      'schoolType': schoolType,
      'schoolTypeNationalUniversities': schoolTypeNationalUniversities,
      'schoolWebsite': schoolWebsite,
      'setting': setting,
      'state': state,
      'tuition': tuition,
      'yearFounded': yearFounded,
      'zip': zip,
      'primaryPhoto': primaryPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class SchoolDataRecordDocumentEquality implements Equality<SchoolDataRecord> {
  const SchoolDataRecordDocumentEquality();

  @override
  bool equals(SchoolDataRecord? e1, SchoolDataRecord? e2) {
    const listEquality = ListEquality();
    return e1?.academicCalendar == e2?.academicCalendar &&
        e1?.acceptanceRate == e2?.acceptanceRate &&
        e1?.actAvg == e2?.actAvg &&
        e1?.address == e2?.address &&
        e1?.aliasNames == e2?.aliasNames &&
        e1?.businessRepScore == e2?.businessRepScore &&
        e1?.city == e2?.city &&
        e1?.costAfterAid == e2?.costAfterAid &&
        e1?.countryCode == e2?.countryCode &&
        e1?.description == e2?.description &&
        e1?.displayName == e2?.displayName &&
        e1?.endowment2018 == e2?.endowment2018 &&
        e1?.engineeringRepScore == e2?.engineeringRepScore &&
        e1?.enrollment == e2?.enrollment &&
        e1?.geoPoint == e2?.geoPoint &&
        e1?.hsGpaAvg == e2?.hsGpaAvg &&
        e1?.institutionalControl == e2?.institutionalControl &&
        e1?.isPublic == e2?.isPublic &&
        e1?.percentReceivingAId == e2?.percentReceivingAId &&
        e1?.rankingDisplayRank == e2?.rankingDisplayRank &&
        e1?.rankingIsTied == e2?.rankingIsTied &&
        e1?.rankingSortRank == e2?.rankingSortRank &&
        e1?.region == e2?.region &&
        e1?.religiousAffiliation == e2?.religiousAffiliation &&
        e1?.satActRangeACT == e2?.satActRangeACT &&
        e1?.satActRangeSAT == e2?.satActRangeSAT &&
        e1?.satAvg == e2?.satAvg &&
        e1?.schoolType == e2?.schoolType &&
        e1?.schoolTypeNationalUniversities ==
            e2?.schoolTypeNationalUniversities &&
        e1?.schoolWebsite == e2?.schoolWebsite &&
        e1?.setting == e2?.setting &&
        e1?.state == e2?.state &&
        e1?.tuition == e2?.tuition &&
        e1?.yearFounded == e2?.yearFounded &&
        e1?.zip == e2?.zip &&
        e1?.primaryPhoto == e2?.primaryPhoto &&
        listEquality.equals(e1?.programRef, e2?.programRef);
  }

  @override
  int hash(SchoolDataRecord? e) => const ListEquality().hash([
        e?.academicCalendar,
        e?.acceptanceRate,
        e?.actAvg,
        e?.address,
        e?.aliasNames,
        e?.businessRepScore,
        e?.city,
        e?.costAfterAid,
        e?.countryCode,
        e?.description,
        e?.displayName,
        e?.endowment2018,
        e?.engineeringRepScore,
        e?.enrollment,
        e?.geoPoint,
        e?.hsGpaAvg,
        e?.institutionalControl,
        e?.isPublic,
        e?.percentReceivingAId,
        e?.rankingDisplayRank,
        e?.rankingIsTied,
        e?.rankingSortRank,
        e?.region,
        e?.religiousAffiliation,
        e?.satActRangeACT,
        e?.satActRangeSAT,
        e?.satAvg,
        e?.schoolType,
        e?.schoolTypeNationalUniversities,
        e?.schoolWebsite,
        e?.setting,
        e?.state,
        e?.tuition,
        e?.yearFounded,
        e?.zip,
        e?.primaryPhoto,
        e?.programRef
      ]);

  @override
  bool isValidKey(Object? o) => o is SchoolDataRecord;
}
