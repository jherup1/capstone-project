import '/components/breadcrumbs_header/breadcrumbs_header_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/schools/school_scroll/school_scroll_widget.dart';
import '/schools/school_scroll_fav/school_scroll_fav_widget.dart';
import 'schools_widget.dart' show SchoolsWidget;
import 'package:flutter/material.dart';

class SchoolsModel extends FlutterFlowModel<SchoolsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel1;
  // Model for BreadcrumbsHeader component.
  late BreadcrumbsHeaderModel breadcrumbsHeaderModel;
  // Model for schoolScrollFav component.
  late SchoolScrollFavModel schoolScrollFavModel;
  // Model for schoolScroll component.
  late SchoolScrollModel schoolScrollModel;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideBarNavModel1 = createModel(context, () => SideBarNavModel());
    breadcrumbsHeaderModel =
        createModel(context, () => BreadcrumbsHeaderModel());
    schoolScrollFavModel = createModel(context, () => SchoolScrollFavModel());
    schoolScrollModel = createModel(context, () => SchoolScrollModel());
    sideBarNavModel2 = createModel(context, () => SideBarNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel1.dispose();
    breadcrumbsHeaderModel.dispose();
    schoolScrollFavModel.dispose();
    schoolScrollModel.dispose();
    sideBarNavModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
