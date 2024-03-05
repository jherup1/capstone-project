import '/flutter_flow/flutter_flow_util.dart';
import '/pages/breadcrumbs_header/breadcrumbs_header_widget.dart';
import '/pages/components/side_bar_nav/side_bar_nav_widget.dart';
import '/schools/favorite_schools_list/favorite_schools_list_widget.dart';
import '/schools/schools_list/schools_list_widget.dart';
import 'schools_widget.dart' show SchoolsWidget;
import 'package:flutter/material.dart';

class SchoolsModel extends FlutterFlowModel<SchoolsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel1;
  // Model for BreadcrumbsHeader component.
  late BreadcrumbsHeaderModel breadcrumbsHeaderModel;
  // Model for favoriteSchoolsList component.
  late FavoriteSchoolsListModel favoriteSchoolsListModel;
  // Model for schoolsList component.
  late SchoolsListModel schoolsListModel;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideBarNavModel1 = createModel(context, () => SideBarNavModel());
    breadcrumbsHeaderModel =
        createModel(context, () => BreadcrumbsHeaderModel());
    favoriteSchoolsListModel =
        createModel(context, () => FavoriteSchoolsListModel());
    schoolsListModel = createModel(context, () => SchoolsListModel());
    sideBarNavModel2 = createModel(context, () => SideBarNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel1.dispose();
    breadcrumbsHeaderModel.dispose();
    favoriteSchoolsListModel.dispose();
    schoolsListModel.dispose();
    sideBarNavModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
