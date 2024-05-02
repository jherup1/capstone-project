import '/backend/backend.dart';
import '/components/breadcrumbs_header/breadcrumbs_header_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_tickets_widget.dart' show AdminTicketsWidget;
import 'package:flutter/material.dart';

class AdminTicketsModel extends FlutterFlowModel<AdminTicketsWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel1;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel2;
  // Model for BreadcrumbsHeader component.
  late BreadcrumbsHeaderModel breadcrumbsHeaderModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<SupportTicketsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    sideBarNavModel1 = createModel(context, () => SideBarNavModel());
    sideBarNavModel2 = createModel(context, () => SideBarNavModel());
    breadcrumbsHeaderModel =
        createModel(context, () => BreadcrumbsHeaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel1.dispose();
    sideBarNavModel2.dispose();
    breadcrumbsHeaderModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
