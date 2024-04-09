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
  }
}
