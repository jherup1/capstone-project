import '/backend/backend.dart';
import '/components/breadcrumbs_header/breadcrumbs_header_widget.dart';
import '/components/side_bar_nav/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/support/empty_state_dynamic/empty_state_dynamic_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'support_ticket_list_model.dart';
export 'support_ticket_list_model.dart';

class SupportTicketListWidget extends StatefulWidget {
  const SupportTicketListWidget({super.key});

  @override
  State<SupportTicketListWidget> createState() =>
      _SupportTicketListWidgetState();
}

class _SupportTicketListWidgetState extends State<SupportTicketListWidget> {
  late SupportTicketListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportTicketListModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'support_TicketList'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Container(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.sideBarNavModel2,
              updateCallback: () => setState(() {}),
              child: SideBarNavWidget(),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                wrapWithModel(
                  model: _model.sideBarNavModel1,
                  updateCallback: () => setState(() {}),
                  child: SideBarNavWidget(),
                ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.breadcrumbsHeaderModel,
                      updateCallback: () => setState(() {}),
                      child: BreadcrumbsHeaderWidget(
                        pageDetails: 'Click on a ticket to vew details',
                        pageTitle: 'List of Tickets',
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: StreamBuilder<List<SupportTicketsRecord>>(
                                stream: querySupportTicketsRecord(
                                  queryBuilder: (supportTicketsRecord) =>
                                      supportTicketsRecord.orderBy('lastActive',
                                          descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<SupportTicketsRecord>
                                      listViewSupportTicketsRecordList =
                                      snapshot.data!;
                                  if (listViewSupportTicketsRecordList
                                      .isEmpty) {
                                    return Center(
                                      child: Container(
                                        height: 330.0,
                                        child: EmptyStateDynamicWidget(
                                          icon: Icon(
                                            Icons.live_help_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 90.0,
                                          ),
                                          title: 'No Support Tickets Exist',
                                          body:
                                              'Ah, you are in luck, none of your support tickets exist.',
                                          buttonText: 'Create Ticket',
                                          buttonAction: () async {
                                            context.pushNamed(
                                                'support_SubmitTicket');
                                          },
                                        ),
                                      ),
                                    );
                                  }
                                  return ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      12.0,
                                      0,
                                      44.0,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewSupportTicketsRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 12.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewSupportTicketsRecord =
                                          listViewSupportTicketsRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'support_TicketDetails',
                                              queryParameters: {
                                                'ticketRef': serializeParam(
                                                  listViewSupportTicketsRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'ticketRef':
                                                    listViewSupportTicketsRecord,
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            constraints: BoxConstraints(
                                              maxWidth: 570.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    listViewSupportTicketsRecord
                                                        .name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily),
                                                        ),
                                                  ),
                                                  AutoSizeText(
                                                    listViewSupportTicketsRecord
                                                        .description
                                                        .maybeHandleOverflow(
                                                            maxChars: 140),
                                                    maxLines: 3,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    minFontSize: 12.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 4.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 12.0,
                                                          height: 12.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: () {
                                                              if (listViewSupportTicketsRecord
                                                                      .priorityLevel ==
                                                                  'High') {
                                                                return Color(
                                                                    0x4CFF5963);
                                                              } else if (listViewSupportTicketsRecord
                                                                      .priorityLevel ==
                                                                  'Medium') {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3;
                                                              } else if (listViewSupportTicketsRecord
                                                                      .priorityLevel ==
                                                                  'Emergency') {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .error;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2;
                                                              }
                                                            }(),
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: () {
                                                                if (listViewSupportTicketsRecord
                                                                        .priorityLevel ==
                                                                    'High') {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .error;
                                                                } else if (listViewSupportTicketsRecord
                                                                        .priorityLevel ==
                                                                    'Medium') {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary;
                                                                } else if (listViewSupportTicketsRecord
                                                                        .priorityLevel ==
                                                                    'Emergency') {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .error;
                                                                } else {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary;
                                                                }
                                                              }(),
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Text(
                                                                listViewSupportTicketsRecord
                                                                    .priorityLevel,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: () {
                                                              if (listViewSupportTicketsRecord
                                                                      .status ==
                                                                  'Submitted') {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3;
                                                              } else if (listViewSupportTicketsRecord
                                                                      .status ==
                                                                  'In Progress') {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1;
                                                              } else if (listViewSupportTicketsRecord
                                                                      .status ==
                                                                  'Complete') {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground;
                                                              }
                                                            }(),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: () {
                                                                if (listViewSupportTicketsRecord
                                                                        .status ==
                                                                    'Submitted') {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary;
                                                                } else if (listViewSupportTicketsRecord
                                                                        .status ==
                                                                    'In Progress') {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary;
                                                                } else if (listViewSupportTicketsRecord
                                                                        .status ==
                                                                    'Complete') {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary;
                                                                } else {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .error;
                                                                }
                                                              }(),
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Text(
                                                                listViewSupportTicketsRecord
                                                                    .status,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color:
                                                                          () {
                                                                        if (listViewSupportTicketsRecord.status ==
                                                                            'Submitted') {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .tertiary;
                                                                        } else if (listViewSupportTicketsRecord.status ==
                                                                            'In Progress') {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .primary;
                                                                        } else if (listViewSupportTicketsRecord.status ==
                                                                            'Complete') {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondary;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        }
                                                                      }(),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  4.0,
                                                                  4.0,
                                                                  4.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        'Ticket #: ',
                                                                    style:
                                                                        TextStyle(),
                                                                  ),
                                                                  TextSpan(
                                                                    text: listViewSupportTicketsRecord
                                                                        .ticketID
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            dateTimeFormat(
                                                                'relative',
                                                                listViewSupportTicketsRecord
                                                                    .lastActive!),
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily),
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
