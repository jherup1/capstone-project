import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_program_widget.dart' show EditProgramWidget;
import 'package:flutter/material.dart';

class EditProgramModel extends FlutterFlowModel<EditProgramWidget> {
  ///  State fields for stateful widgets in this component.

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
  // State field(s) for region widget.
  FocusNode? regionFocusNode;
  TextEditingController? regionTextController;
  String? Function(BuildContext, String?)? regionTextControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode1;
  TextEditingController? cityTextController1;
  String? Function(BuildContext, String?)? cityTextController1Validator;
  // State field(s) for zip widget.
  FocusNode? zipFocusNode;
  TextEditingController? zipTextController;
  String? Function(BuildContext, String?)? zipTextControllerValidator;
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
  // State field(s) for acceptanceRate widget.
  FocusNode? acceptanceRateFocusNode;
  TextEditingController? acceptanceRateTextController;
  String? Function(BuildContext, String?)?
      acceptanceRateTextControllerValidator;
  // State field(s) for displayRank widget.
  FocusNode? displayRankFocusNode;
  TextEditingController? displayRankTextController;
  String? Function(BuildContext, String?)? displayRankTextControllerValidator;
  // State field(s) for enrollment widget.
  FocusNode? enrollmentFocusNode;
  TextEditingController? enrollmentTextController;
  String? Function(BuildContext, String?)? enrollmentTextControllerValidator;
  // State field(s) for hsGpaAvg widget.
  FocusNode? hsGpaAvgFocusNode1;
  TextEditingController? hsGpaAvgTextController1;
  String? Function(BuildContext, String?)? hsGpaAvgTextController1Validator;
  // State field(s) for actAvg widget.
  FocusNode? actAvgFocusNode1;
  TextEditingController? actAvgTextController1;
  String? Function(BuildContext, String?)? actAvgTextController1Validator;
  // State field(s) for satAvg widget.
  FocusNode? satAvgFocusNode1;
  TextEditingController? satAvgTextController1;
  String? Function(BuildContext, String?)? satAvgTextController1Validator;
  // State field(s) for engRepScore widget.
  FocusNode? engRepScoreFocusNode;
  TextEditingController? engRepScoreTextController;
  String? Function(BuildContext, String?)? engRepScoreTextControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode2;
  TextEditingController? cityTextController2;
  String? Function(BuildContext, String?)? cityTextController2Validator;
  // State field(s) for hsGpaAvg widget.
  FocusNode? hsGpaAvgFocusNode2;
  TextEditingController? hsGpaAvgTextController2;
  String? Function(BuildContext, String?)? hsGpaAvgTextController2Validator;
  // State field(s) for actAvg widget.
  FocusNode? actAvgFocusNode2;
  TextEditingController? actAvgTextController2;
  String? Function(BuildContext, String?)? actAvgTextController2Validator;
  // State field(s) for satAvg widget.
  FocusNode? satAvgFocusNode2;
  TextEditingController? satAvgTextController2;
  String? Function(BuildContext, String?)? satAvgTextController2Validator;
  // State field(s) for satAvg widget.
  FocusNode? satAvgFocusNode3;
  TextEditingController? satAvgTextController3;
  String? Function(BuildContext, String?)? satAvgTextController3Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

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

    regionFocusNode?.dispose();
    regionTextController?.dispose();

    cityFocusNode1?.dispose();
    cityTextController1?.dispose();

    zipFocusNode?.dispose();
    zipTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    geoPointFocusNode?.dispose();
    geoPointTextController?.dispose();

    tutionFocusNode?.dispose();
    tutionTextController?.dispose();

    acceptanceRateFocusNode?.dispose();
    acceptanceRateTextController?.dispose();

    displayRankFocusNode?.dispose();
    displayRankTextController?.dispose();

    enrollmentFocusNode?.dispose();
    enrollmentTextController?.dispose();

    hsGpaAvgFocusNode1?.dispose();
    hsGpaAvgTextController1?.dispose();

    actAvgFocusNode1?.dispose();
    actAvgTextController1?.dispose();

    satAvgFocusNode1?.dispose();
    satAvgTextController1?.dispose();

    engRepScoreFocusNode?.dispose();
    engRepScoreTextController?.dispose();

    cityFocusNode2?.dispose();
    cityTextController2?.dispose();

    hsGpaAvgFocusNode2?.dispose();
    hsGpaAvgTextController2?.dispose();

    actAvgFocusNode2?.dispose();
    actAvgTextController2?.dispose();

    satAvgFocusNode2?.dispose();
    satAvgTextController2?.dispose();

    satAvgFocusNode3?.dispose();
    satAvgTextController3?.dispose();
  }
}
