import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/side_bar_nav/side_bar_nav_widget.dart';
import 'admin_portal_widget.dart' show AdminPortalWidget;
import 'package:flutter/material.dart';

class AdminPortalModel extends FlutterFlowModel<AdminPortalWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in adminPortal widget.
  UsersRecord? adminActionOutput1;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel1;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideBarNavModel1 = createModel(context, () => SideBarNavModel());
    sideBarNavModel2 = createModel(context, () => SideBarNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel1.dispose();
    sideBarNavModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
