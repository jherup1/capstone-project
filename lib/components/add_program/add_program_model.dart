import '/flutter_flow/flutter_flow_util.dart';
import 'add_program_widget.dart' show AddProgramWidget;
import 'package:flutter/material.dart';

class AddProgramModel extends FlutterFlowModel<AddProgramWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for iuser widget.
  bool iuserHovered1 = false;
  // State field(s) for iuser widget.
  bool iuserHovered2 = false;
  // State field(s) for iuser widget.
  bool iuserHovered3 = false;
  // State field(s) for iuser widget.
  bool iuserHovered4 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
