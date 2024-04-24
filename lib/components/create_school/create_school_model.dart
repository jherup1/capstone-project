import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_school_widget.dart' show CreateSchoolWidget;
import 'package:flutter/material.dart';

class CreateSchoolModel extends FlutterFlowModel<CreateSchoolWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameTextController;
  String? Function(BuildContext, String?)? displayNameTextControllerValidator;
  // State field(s) for aliasName widget.
  FocusNode? aliasNameFocusNode;
  TextEditingController? aliasNameTextController;
  String? Function(BuildContext, String?)? aliasNameTextControllerValidator;
  // State field(s) for schoolDescription widget.
  FocusNode? schoolDescriptionFocusNode;
  TextEditingController? schoolDescriptionTextController;
  String? Function(BuildContext, String?)?
      schoolDescriptionTextControllerValidator;
  // State field(s) for schoolWebsite widget.
  FocusNode? schoolWebsiteFocusNode;
  TextEditingController? schoolWebsiteTextController;
  String? Function(BuildContext, String?)? schoolWebsiteTextControllerValidator;
  // State field(s) for countryCode widget.
  FocusNode? countryCodeFocusNode;
  TextEditingController? countryCodeTextController;
  String? Function(BuildContext, String?)? countryCodeTextControllerValidator;
  // State field(s) for state widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateTextController;
  String? Function(BuildContext, String?)? stateTextControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for zip widget.
  FocusNode? zipFocusNode;
  TextEditingController? zipTextController;
  String? Function(BuildContext, String?)? zipTextControllerValidator;
  // State field(s) for region widget.
  FocusNode? regionFocusNode;
  TextEditingController? regionTextController;
  String? Function(BuildContext, String?)? regionTextControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for geoPoint widget.
  FocusNode? geoPointFocusNode;
  TextEditingController? geoPointTextController;
  String? Function(BuildContext, String?)? geoPointTextControllerValidator;
  // State field(s) for tution widget.
  FocusNode? tutionFocusNode;
  TextEditingController? tutionTextController;
  String? Function(BuildContext, String?)? tutionTextControllerValidator;
  // State field(s) for costAfterAid widget.
  FocusNode? costAfterAidFocusNode;
  TextEditingController? costAfterAidTextController;
  String? Function(BuildContext, String?)? costAfterAidTextControllerValidator;
  // State field(s) for percentRecievingAid widget.
  FocusNode? percentRecievingAidFocusNode;
  TextEditingController? percentRecievingAidTextController;
  String? Function(BuildContext, String?)?
      percentRecievingAidTextControllerValidator;
  // State field(s) for enrollment widget.
  FocusNode? enrollmentFocusNode;
  TextEditingController? enrollmentTextController;
  String? Function(BuildContext, String?)? enrollmentTextControllerValidator;
  // State field(s) for acceptanceRate widget.
  FocusNode? acceptanceRateFocusNode;
  TextEditingController? acceptanceRateTextController;
  String? Function(BuildContext, String?)?
      acceptanceRateTextControllerValidator;
  // State field(s) for displayRank widget.
  FocusNode? displayRankFocusNode;
  TextEditingController? displayRankTextController;
  String? Function(BuildContext, String?)? displayRankTextControllerValidator;
  // State field(s) for rankSortRank widget.
  FocusNode? rankSortRankFocusNode;
  TextEditingController? rankSortRankTextController;
  String? Function(BuildContext, String?)? rankSortRankTextControllerValidator;
  // State field(s) for rankIsTied widget.
  String? rankIsTiedValue;
  FormFieldController<String>? rankIsTiedValueController;
  // State field(s) for actAvg widget.
  FocusNode? actAvgFocusNode;
  TextEditingController? actAvgTextController;
  String? Function(BuildContext, String?)? actAvgTextControllerValidator;
  // State field(s) for satActRangeACT widget.
  FocusNode? satActRangeACTFocusNode;
  TextEditingController? satActRangeACTTextController;
  String? Function(BuildContext, String?)?
      satActRangeACTTextControllerValidator;
  // State field(s) for satAvg widget.
  FocusNode? satAvgFocusNode;
  TextEditingController? satAvgTextController;
  String? Function(BuildContext, String?)? satAvgTextControllerValidator;
  // State field(s) for satActRangeSAT widget.
  FocusNode? satActRangeSATFocusNode;
  TextEditingController? satActRangeSATTextController;
  String? Function(BuildContext, String?)?
      satActRangeSATTextControllerValidator;
  // State field(s) for hsGpaAvg widget.
  FocusNode? hsGpaAvgFocusNode;
  TextEditingController? hsGpaAvgTextController;
  String? Function(BuildContext, String?)? hsGpaAvgTextControllerValidator;
  // State field(s) for engRepScore widget.
  FocusNode? engRepScoreFocusNode;
  TextEditingController? engRepScoreTextController;
  String? Function(BuildContext, String?)? engRepScoreTextControllerValidator;
  // State field(s) for busRepScore widget.
  FocusNode? busRepScoreFocusNode;
  TextEditingController? busRepScoreTextController;
  String? Function(BuildContext, String?)? busRepScoreTextControllerValidator;
  // State field(s) for instituationalControl widget.
  FocusNode? instituationalControlFocusNode;
  TextEditingController? instituationalControlTextController;
  String? Function(BuildContext, String?)?
      instituationalControlTextControllerValidator;
  // State field(s) for religiousAffiliation widget.
  FocusNode? religiousAffiliationFocusNode;
  TextEditingController? religiousAffiliationTextController;
  String? Function(BuildContext, String?)?
      religiousAffiliationTextControllerValidator;
  // State field(s) for schoolType widget.
  FocusNode? schoolTypeFocusNode;
  TextEditingController? schoolTypeTextController;
  String? Function(BuildContext, String?)? schoolTypeTextControllerValidator;
  // State field(s) for schoolTypeNational widget.
  FocusNode? schoolTypeNationalFocusNode;
  TextEditingController? schoolTypeNationalTextController;
  String? Function(BuildContext, String?)?
      schoolTypeNationalTextControllerValidator;
  // State field(s) for isPublic widget.
  String? isPublicValue;
  FormFieldController<String>? isPublicValueController;
  // State field(s) for yearFounded widget.
  FocusNode? yearFoundedFocusNode;
  TextEditingController? yearFoundedTextController;
  String? Function(BuildContext, String?)? yearFoundedTextControllerValidator;
  // State field(s) for setting widget.
  FocusNode? settingFocusNode;
  TextEditingController? settingTextController;
  String? Function(BuildContext, String?)? settingTextControllerValidator;
  // State field(s) for endowment2018 widget.
  FocusNode? endowment2018FocusNode;
  TextEditingController? endowment2018TextController;
  String? Function(BuildContext, String?)? endowment2018TextControllerValidator;
  // State field(s) for academicCalendar widget.
  FocusNode? academicCalendarFocusNode;
  TextEditingController? academicCalendarTextController;
  String? Function(BuildContext, String?)?
      academicCalendarTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    displayNameFocusNode?.dispose();
    displayNameTextController?.dispose();

    aliasNameFocusNode?.dispose();
    aliasNameTextController?.dispose();

    schoolDescriptionFocusNode?.dispose();
    schoolDescriptionTextController?.dispose();

    schoolWebsiteFocusNode?.dispose();
    schoolWebsiteTextController?.dispose();

    countryCodeFocusNode?.dispose();
    countryCodeTextController?.dispose();

    stateFocusNode?.dispose();
    stateTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    zipFocusNode?.dispose();
    zipTextController?.dispose();

    regionFocusNode?.dispose();
    regionTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    geoPointFocusNode?.dispose();
    geoPointTextController?.dispose();

    tutionFocusNode?.dispose();
    tutionTextController?.dispose();

    costAfterAidFocusNode?.dispose();
    costAfterAidTextController?.dispose();

    percentRecievingAidFocusNode?.dispose();
    percentRecievingAidTextController?.dispose();

    enrollmentFocusNode?.dispose();
    enrollmentTextController?.dispose();

    acceptanceRateFocusNode?.dispose();
    acceptanceRateTextController?.dispose();

    displayRankFocusNode?.dispose();
    displayRankTextController?.dispose();

    rankSortRankFocusNode?.dispose();
    rankSortRankTextController?.dispose();

    actAvgFocusNode?.dispose();
    actAvgTextController?.dispose();

    satActRangeACTFocusNode?.dispose();
    satActRangeACTTextController?.dispose();

    satAvgFocusNode?.dispose();
    satAvgTextController?.dispose();

    satActRangeSATFocusNode?.dispose();
    satActRangeSATTextController?.dispose();

    hsGpaAvgFocusNode?.dispose();
    hsGpaAvgTextController?.dispose();

    engRepScoreFocusNode?.dispose();
    engRepScoreTextController?.dispose();

    busRepScoreFocusNode?.dispose();
    busRepScoreTextController?.dispose();

    instituationalControlFocusNode?.dispose();
    instituationalControlTextController?.dispose();

    religiousAffiliationFocusNode?.dispose();
    religiousAffiliationTextController?.dispose();

    schoolTypeFocusNode?.dispose();
    schoolTypeTextController?.dispose();

    schoolTypeNationalFocusNode?.dispose();
    schoolTypeNationalTextController?.dispose();

    yearFoundedFocusNode?.dispose();
    yearFoundedTextController?.dispose();

    settingFocusNode?.dispose();
    settingTextController?.dispose();

    endowment2018FocusNode?.dispose();
    endowment2018TextController?.dispose();

    academicCalendarFocusNode?.dispose();
    academicCalendarTextController?.dispose();
  }
}
