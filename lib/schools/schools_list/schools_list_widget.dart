import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/schools/schools_card/schools_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'schools_list_model.dart';
export 'schools_list_model.dart';

class SchoolsListWidget extends StatefulWidget {
  const SchoolsListWidget({super.key});

  @override
  State<SchoolsListWidget> createState() => _SchoolsListWidgetState();
}

class _SchoolsListWidgetState extends State<SchoolsListWidget> {
  late SchoolsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SchoolsListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 240.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
        child: PagedListView<DocumentSnapshot<Object?>?, SchoolsRecord>(
          pagingController: _model.setListViewController(
            SchoolsRecord.collection,
          ),
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          reverse: false,
          scrollDirection: Axis.horizontal,
          builderDelegate: PagedChildBuilderDelegate<SchoolsRecord>(
            // Customize what your widget looks like when it's loading the first page.
            firstPageProgressIndicatorBuilder: (_) => Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).tertiary,
                  ),
                ),
              ),
            ),
            // Customize what your widget looks like when it's loading another page.
            newPageProgressIndicatorBuilder: (_) => Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).tertiary,
                  ),
                ),
              ),
            ),

            itemBuilder: (context, _, listViewIndex) {
              final listViewSchoolsRecord =
                  _model.listViewPagingController!.itemList![listViewIndex];
              return SchoolsCardWidget(
                key: Key(
                    'Key6g8_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                parameter1: listViewSchoolsRecord.name,
              );
            },
          ),
        ),
      ),
    );
  }
}
