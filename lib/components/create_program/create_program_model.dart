import '/flutter_flow/flutter_flow_util.dart';
import 'create_program_widget.dart' show CreateProgramWidget;
import 'package:flutter/material.dart';

class CreateProgramModel extends FlutterFlowModel<CreateProgramWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameTextController;
  String? Function(BuildContext, String?)? displayNameTextControllerValidator;
  // State field(s) for programDescription widget.
  FocusNode? programDescriptionFocusNode;
  TextEditingController? programDescriptionTextController;
  String? Function(BuildContext, String?)?
      programDescriptionTextControllerValidator;
  // State field(s) for programWebsite widget.
  FocusNode? programWebsiteFocusNode;
  TextEditingController? programWebsiteTextController;
  String? Function(BuildContext, String?)?
      programWebsiteTextControllerValidator;
  // State field(s) for programPhotoLink widget.
  FocusNode? programPhotoLinkFocusNode;
  TextEditingController? programPhotoLinkTextController;
  String? Function(BuildContext, String?)?
      programPhotoLinkTextControllerValidator;
  // State field(s) for programJobs widget.
  FocusNode? programJobsFocusNode;
  TextEditingController? programJobsTextController;
  String? Function(BuildContext, String?)? programJobsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    displayNameFocusNode?.dispose();
    displayNameTextController?.dispose();

    programDescriptionFocusNode?.dispose();
    programDescriptionTextController?.dispose();

    programWebsiteFocusNode?.dispose();
    programWebsiteTextController?.dispose();

    programPhotoLinkFocusNode?.dispose();
    programPhotoLinkTextController?.dispose();

    programJobsFocusNode?.dispose();
    programJobsTextController?.dispose();
  }
}
