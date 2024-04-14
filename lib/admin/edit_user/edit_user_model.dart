import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_user_widget.dart' show EditUserWidget;
import 'package:flutter/material.dart';

class EditUserModel extends FlutterFlowModel<EditUserWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for userDisplayName widget.
  FocusNode? userDisplayNameFocusNode;
  TextEditingController? userDisplayNameController;
  String? Function(BuildContext, String?)? userDisplayNameControllerValidator;
  // State field(s) for userLastName widget.
  FocusNode? userLastNameFocusNode;
  TextEditingController? userLastNameController;
  String? Function(BuildContext, String?)? userLastNameControllerValidator;
  // State field(s) for userEmail widget.
  FocusNode? userEmailFocusNode;
  TextEditingController? userEmailController;
  String? Function(BuildContext, String?)? userEmailControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userDisplayNameFocusNode?.dispose();
    userDisplayNameController?.dispose();

    userLastNameFocusNode?.dispose();
    userLastNameController?.dispose();

    userEmailFocusNode?.dispose();
    userEmailController?.dispose();
  }
}
