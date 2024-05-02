import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'create_program_widget.dart' show CreateProgramWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
