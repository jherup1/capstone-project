import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_schools_widget.dart' show AdminSchoolsWidget;
import 'package:flutter/material.dart';

class AdminSchoolsModel extends FlutterFlowModel<AdminSchoolsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in adminSchools widget.
  UsersRecord? adminActionOutput1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
