import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_school_widget.dart' show EditSchoolWidget;
import 'package:flutter/material.dart';

class EditSchoolModel extends FlutterFlowModel<EditSchoolWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameController;
  String? Function(BuildContext, String?)? displayNameControllerValidator;
  // State field(s) for aliasName widget.
  FocusNode? aliasNameFocusNode;
  TextEditingController? aliasNameController;
  String? Function(BuildContext, String?)? aliasNameControllerValidator;
  // State field(s) for schoolDescription widget.
  FocusNode? schoolDescriptionFocusNode;
  TextEditingController? schoolDescriptionController;
  String? Function(BuildContext, String?)? schoolDescriptionControllerValidator;
  // State field(s) for schoolWebsite widget.
  FocusNode? schoolWebsiteFocusNode;
  TextEditingController? schoolWebsiteController;
  String? Function(BuildContext, String?)? schoolWebsiteControllerValidator;
  // State field(s) for countryCode widget.
  FocusNode? countryCodeFocusNode;
  TextEditingController? countryCodeController;
  String? Function(BuildContext, String?)? countryCodeControllerValidator;
  // State field(s) for region widget.
  FocusNode? regionFocusNode;
  TextEditingController? regionController;
  String? Function(BuildContext, String?)? regionControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode1;
  TextEditingController? cityController1;
  String? Function(BuildContext, String?)? cityController1Validator;
  // State field(s) for zip widget.
  FocusNode? zipFocusNode;
  TextEditingController? zipController;
  String? Function(BuildContext, String?)? zipControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  // State field(s) for geoPoint widget.
  FocusNode? geoPointFocusNode;
  TextEditingController? geoPointController;
  String? Function(BuildContext, String?)? geoPointControllerValidator;
  // State field(s) for tution widget.
  FocusNode? tutionFocusNode;
  TextEditingController? tutionController;
  String? Function(BuildContext, String?)? tutionControllerValidator;
  // State field(s) for acceptanceRate widget.
  FocusNode? acceptanceRateFocusNode;
  TextEditingController? acceptanceRateController;
  String? Function(BuildContext, String?)? acceptanceRateControllerValidator;
  // State field(s) for displayRank widget.
  FocusNode? displayRankFocusNode;
  TextEditingController? displayRankController;
  String? Function(BuildContext, String?)? displayRankControllerValidator;
  // State field(s) for enrollment widget.
  FocusNode? enrollmentFocusNode;
  TextEditingController? enrollmentController;
  String? Function(BuildContext, String?)? enrollmentControllerValidator;
  // State field(s) for hsGpaAvg widget.
  FocusNode? hsGpaAvgFocusNode1;
  TextEditingController? hsGpaAvgController1;
  String? Function(BuildContext, String?)? hsGpaAvgController1Validator;
  // State field(s) for actAvg widget.
  FocusNode? actAvgFocusNode1;
  TextEditingController? actAvgController1;
  String? Function(BuildContext, String?)? actAvgController1Validator;
  // State field(s) for satAvg widget.
  FocusNode? satAvgFocusNode1;
  TextEditingController? satAvgController1;
  String? Function(BuildContext, String?)? satAvgController1Validator;
  // State field(s) for engRepScore widget.
  FocusNode? engRepScoreFocusNode;
  TextEditingController? engRepScoreController;
  String? Function(BuildContext, String?)? engRepScoreControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode2;
  TextEditingController? cityController2;
  String? Function(BuildContext, String?)? cityController2Validator;
  // State field(s) for hsGpaAvg widget.
  FocusNode? hsGpaAvgFocusNode2;
  TextEditingController? hsGpaAvgController2;
  String? Function(BuildContext, String?)? hsGpaAvgController2Validator;
  // State field(s) for actAvg widget.
  FocusNode? actAvgFocusNode2;
  TextEditingController? actAvgController2;
  String? Function(BuildContext, String?)? actAvgController2Validator;
  // State field(s) for satAvg widget.
  FocusNode? satAvgFocusNode2;
  TextEditingController? satAvgController2;
  String? Function(BuildContext, String?)? satAvgController2Validator;
  // State field(s) for satAvg widget.
  FocusNode? satAvgFocusNode3;
  TextEditingController? satAvgController3;
  String? Function(BuildContext, String?)? satAvgController3Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    displayNameFocusNode?.dispose();
    displayNameController?.dispose();

    aliasNameFocusNode?.dispose();
    aliasNameController?.dispose();

    schoolDescriptionFocusNode?.dispose();
    schoolDescriptionController?.dispose();

    schoolWebsiteFocusNode?.dispose();
    schoolWebsiteController?.dispose();

    countryCodeFocusNode?.dispose();
    countryCodeController?.dispose();

    regionFocusNode?.dispose();
    regionController?.dispose();

    cityFocusNode1?.dispose();
    cityController1?.dispose();

    zipFocusNode?.dispose();
    zipController?.dispose();

    addressFocusNode?.dispose();
    addressController?.dispose();

    geoPointFocusNode?.dispose();
    geoPointController?.dispose();

    tutionFocusNode?.dispose();
    tutionController?.dispose();

    acceptanceRateFocusNode?.dispose();
    acceptanceRateController?.dispose();

    displayRankFocusNode?.dispose();
    displayRankController?.dispose();

    enrollmentFocusNode?.dispose();
    enrollmentController?.dispose();

    hsGpaAvgFocusNode1?.dispose();
    hsGpaAvgController1?.dispose();

    actAvgFocusNode1?.dispose();
    actAvgController1?.dispose();

    satAvgFocusNode1?.dispose();
    satAvgController1?.dispose();

    engRepScoreFocusNode?.dispose();
    engRepScoreController?.dispose();

    cityFocusNode2?.dispose();
    cityController2?.dispose();

    hsGpaAvgFocusNode2?.dispose();
    hsGpaAvgController2?.dispose();

    actAvgFocusNode2?.dispose();
    actAvgController2?.dispose();

    satAvgFocusNode2?.dispose();
    satAvgController2?.dispose();

    satAvgFocusNode3?.dispose();
    satAvgController3?.dispose();
  }
}
