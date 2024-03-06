import '/backend/backend.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_users_widget.dart' show AdminUsersWidget;
import 'package:flutter/material.dart';

class AdminUsersModel extends FlutterFlowModel<AdminUsersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in adminUsers widget.
  UsersRecord? adminActionOutput1;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
