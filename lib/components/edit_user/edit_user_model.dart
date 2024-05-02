import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_user_widget.dart' show EditUserWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditUserModel extends FlutterFlowModel<EditUserWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameTextController;
  String? Function(BuildContext, String?)? displayNameTextControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  final phoneNumberMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for roleDropDown widget.
  String? roleDropDownValue;
  FormFieldController<String>? roleDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    displayNameFocusNode?.dispose();
    displayNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
