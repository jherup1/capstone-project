import '/components/breadcrumbs_header/breadcrumbs_header_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_page_widget.dart' show EditProfilePageWidget;
import 'package:flutter/material.dart';

class EditProfilePageModel extends FlutterFlowModel<EditProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel1;
  // Model for BreadcrumbsHeader component.
  late BreadcrumbsHeaderModel breadcrumbsHeaderModel;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel2;

  @override
  void initState(BuildContext context) {
    sideBarNavModel1 = createModel(context, () => SideBarNavModel());
    breadcrumbsHeaderModel =
        createModel(context, () => BreadcrumbsHeaderModel());
    passwordVisibility = false;
    sideBarNavModel2 = createModel(context, () => SideBarNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel1.dispose();
    breadcrumbsHeaderModel.dispose();
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    sideBarNavModel2.dispose();
  }
}
