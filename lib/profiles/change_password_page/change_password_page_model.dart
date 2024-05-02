import '/components/breadcrumbs_header/breadcrumbs_header_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'change_password_page_widget.dart' show ChangePasswordPageWidget;
import 'package:flutter/material.dart';

class ChangePasswordPageModel
    extends FlutterFlowModel<ChangePasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel1;
  // Model for BreadcrumbsHeader component.
  late BreadcrumbsHeaderModel breadcrumbsHeaderModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for currentPassword widget.
  FocusNode? currentPasswordFocusNode;
  TextEditingController? currentPasswordTextController;
  late bool currentPasswordVisibility;
  String? Function(BuildContext, String?)?
      currentPasswordTextControllerValidator;
  // State field(s) for newPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  // State field(s) for confirmNewPassword widget.
  FocusNode? confirmNewPasswordFocusNode;
  TextEditingController? confirmNewPasswordTextController;
  late bool confirmNewPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmNewPasswordTextControllerValidator;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel2;

  @override
  void initState(BuildContext context) {
    sideBarNavModel1 = createModel(context, () => SideBarNavModel());
    breadcrumbsHeaderModel =
        createModel(context, () => BreadcrumbsHeaderModel());
    currentPasswordVisibility = false;
    newPasswordVisibility = false;
    confirmNewPasswordVisibility = false;
    sideBarNavModel2 = createModel(context, () => SideBarNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel1.dispose();
    breadcrumbsHeaderModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    currentPasswordFocusNode?.dispose();
    currentPasswordTextController?.dispose();

    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();

    confirmNewPasswordFocusNode?.dispose();
    confirmNewPasswordTextController?.dispose();

    sideBarNavModel2.dispose();
  }
}
