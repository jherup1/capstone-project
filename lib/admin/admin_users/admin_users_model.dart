import '/backend/backend.dart';
import '/components/breadcrumbs_header/breadcrumbs_header_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'admin_users_widget.dart' show AdminUsersWidget;
import 'package:flutter/material.dart';

class AdminUsersModel extends FlutterFlowModel<AdminUsersWidget> {
  ///  Local state fields for this page.

  SchoolsRecord? school;

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
  List<UsersRecord> simpleSearchResults = [];
  // State field(s) for RoleFilters widget.
  FormFieldController<List<String>>? roleFiltersValueController;
  String? get roleFiltersValue =>
      roleFiltersValueController?.value?.firstOrNull;
  set roleFiltersValue(String? val) =>
      roleFiltersValueController?.value = val != null ? [val] : [];

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
