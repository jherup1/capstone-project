import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_school_widget.dart' show AddSchoolWidget;
import 'package:flutter/material.dart';

class AddSchoolModel extends FlutterFlowModel<AddSchoolWidget> {
  ///  Local state fields for this component.

  bool isShowFullList = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<SchoolDataRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
