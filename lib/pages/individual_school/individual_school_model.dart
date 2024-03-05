import '/components/individ_schools_program_info_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'individual_school_widget.dart' show IndividualSchoolWidget;
import 'package:flutter/material.dart';

class IndividualSchoolModel extends FlutterFlowModel<IndividualSchoolWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for individSchoolsProgramInfo component.
  late IndividSchoolsProgramInfoModel individSchoolsProgramInfoModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    individSchoolsProgramInfoModel =
        createModel(context, () => IndividSchoolsProgramInfoModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    individSchoolsProgramInfoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
