import '/components/breadcrumbs_header/breadcrumbs_header_widget.dart';
import '/components/program_scroll/program_scroll_widget.dart';
import '/components/program_scroll_fav/program_scroll_fav_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'programs_widget.dart' show ProgramsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProgramsModel extends FlutterFlowModel<ProgramsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel1;
  // Model for BreadcrumbsHeader component.
  late BreadcrumbsHeaderModel breadcrumbsHeaderModel;
  // Model for programScrollFav component.
  late ProgramScrollFavModel programScrollFavModel;
  // Model for programScroll component.
  late ProgramScrollModel programScrollModel;
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel2;

  @override
  void initState(BuildContext context) {
    sideBarNavModel1 = createModel(context, () => SideBarNavModel());
    breadcrumbsHeaderModel =
        createModel(context, () => BreadcrumbsHeaderModel());
    programScrollFavModel = createModel(context, () => ProgramScrollFavModel());
    programScrollModel = createModel(context, () => ProgramScrollModel());
    sideBarNavModel2 = createModel(context, () => SideBarNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel1.dispose();
    breadcrumbsHeaderModel.dispose();
    programScrollFavModel.dispose();
    programScrollModel.dispose();
    sideBarNavModel2.dispose();
  }
}
