import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/support/user_list_small/user_list_small_widget.dart';
import 'user_list_widget.dart' show UserListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserListModel extends FlutterFlowModel<UserListWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for user_ListSmall dynamic component.
  late FlutterFlowDynamicModels<UserListSmallModel> userListSmallModels;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    userListSmallModels = FlutterFlowDynamicModels(() => UserListSmallModel());
  }

  @override
  void dispose() {
    userListSmallModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
