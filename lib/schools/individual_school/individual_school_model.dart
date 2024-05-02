import '/components/individ_schools_program_info/individ_schools_program_info_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'individual_school_widget.dart' show IndividualSchoolWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IndividualSchoolModel extends FlutterFlowModel<IndividualSchoolWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for individSchoolsProgramInfo component.
  late IndividSchoolsProgramInfoModel individSchoolsProgramInfoModel;

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
}
