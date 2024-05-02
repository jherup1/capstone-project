import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_user_o_l_d_widget.dart' show EditUserOLDWidget;
import 'package:flutter/material.dart';

class EditUserOLDModel extends FlutterFlowModel<EditUserOLDWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for userDisplayName widget.
  FocusNode? userDisplayNameFocusNode;
  TextEditingController? userDisplayNameTextController;
  String? Function(BuildContext, String?)?
      userDisplayNameTextControllerValidator;
  // State field(s) for userLastName widget.
  FocusNode? userLastNameFocusNode;
  TextEditingController? userLastNameTextController;
  String? Function(BuildContext, String?)? userLastNameTextControllerValidator;
  // State field(s) for userEmail widget.
  FocusNode? userEmailFocusNode;
  TextEditingController? userEmailTextController;
  String? Function(BuildContext, String?)? userEmailTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userDisplayNameFocusNode?.dispose();
    userDisplayNameTextController?.dispose();

    userLastNameFocusNode?.dispose();
    userLastNameTextController?.dispose();

    userEmailFocusNode?.dispose();
    userEmailTextController?.dispose();
  }
}
