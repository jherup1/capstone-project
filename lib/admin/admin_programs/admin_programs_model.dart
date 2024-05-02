import '/backend/backend.dart';
import '/components/breadcrumbs_header/breadcrumbs_header_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_programs_widget.dart' show AdminProgramsWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AdminProgramsModel extends FlutterFlowModel<AdminProgramsWidget> {
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
  List<ProgramDataRecord> simpleSearchResults = [];
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProgramDataRecord>?
      listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

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

    for (var s in listViewStreamSubscriptions1) {
      s?.cancel();
    }
    listViewPagingController1?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, ProgramDataRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, ProgramDataRecord>
      _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, ProgramDataRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProgramDataRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }
}
