import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_tickets_widget.dart' show AdminTicketsWidget;
import 'package:flutter/material.dart';

class AdminTicketsModel extends FlutterFlowModel<AdminTicketsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in adminTickets widget.
  UsersRecord? adminActionOutput1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
