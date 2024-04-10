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
  FocusNode? zipFocusNode1;
  TextEditingController? zipController1;
  String? Function(BuildContext, String?)? zipController1Validator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode1;
  TextEditingController? addressController1;
  String? Function(BuildContext, String?)? addressController1Validator;
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
  FocusNode? hsGpaAvgFocusNode;
  TextEditingController? hsGpaAvgController;
  String? Function(BuildContext, String?)? hsGpaAvgControllerValidator;
  // State field(s) for actAvg widget.
  FocusNode? actAvgFocusNode;
  TextEditingController? actAvgController;
  String? Function(BuildContext, String?)? actAvgControllerValidator;
  // State field(s) for satAvg widget.
  FocusNode? satAvgFocusNode;
  TextEditingController? satAvgController;
  String? Function(BuildContext, String?)? satAvgControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode2;
  TextEditingController? addressController2;
  String? Function(BuildContext, String?)? addressController2Validator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode2;
  TextEditingController? cityController2;
  String? Function(BuildContext, String?)? cityController2Validator;
  // State field(s) for zip widget.
  FocusNode? zipFocusNode2;
  TextEditingController? zipController2;
  String? Function(BuildContext, String?)? zipController2Validator;
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

    zipFocusNode1?.dispose();
    zipController1?.dispose();

    addressFocusNode1?.dispose();
    addressController1?.dispose();

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

    hsGpaAvgFocusNode?.dispose();
    hsGpaAvgController?.dispose();

    actAvgFocusNode?.dispose();
    actAvgController?.dispose();

    satAvgFocusNode?.dispose();
    satAvgController?.dispose();

    addressFocusNode2?.dispose();
    addressController2?.dispose();

    cityFocusNode2?.dispose();
    cityController2?.dispose();

    zipFocusNode2?.dispose();
    zipController2?.dispose();
  }
}
