import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/schools/schools_card/schools_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'favorite_schools_list_model.dart';
export 'favorite_schools_list_model.dart';

class FavoriteSchoolsListWidget extends StatefulWidget {
  const FavoriteSchoolsListWidget({super.key});

  @override
  State<FavoriteSchoolsListWidget> createState() =>
      _FavoriteSchoolsListWidgetState();
}

class _FavoriteSchoolsListWidgetState extends State<FavoriteSchoolsListWidget> {
  late FavoriteSchoolsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoriteSchoolsListModel());

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
        child: PagedListView<DocumentSnapshot<Object?>?, FavoriteSchoolsRecord>(
          pagingController: _model.setListViewController(
            FavoriteSchoolsRecord.collection.where(
              'uid',
              isEqualTo: currentUserUid,
            ),
          ),
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          reverse: false,
          scrollDirection: Axis.horizontal,
          builderDelegate: PagedChildBuilderDelegate<FavoriteSchoolsRecord>(
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
              final listViewFavoriteSchoolsRecord =
                  _model.listViewPagingController!.itemList![listViewIndex];
              return SchoolsCardWidget(
                key: Key(
                    'Keylqh_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                parameter1: listViewFavoriteSchoolsRecord.schoolName,
              );
            },
          ),
        ),
      ),
    );
  }
}
