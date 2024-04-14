import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_ticket_widget.dart' show EditTicketWidget;
import 'package:flutter/material.dart';

class EditTicketModel extends FlutterFlowModel<EditTicketWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ticketName widget.
  FocusNode? ticketNameFocusNode;
  TextEditingController? ticketNameController;
  String? Function(BuildContext, String?)? ticketNameControllerValidator;
  // State field(s) for ticketDescription widget.
  FocusNode? ticketDescriptionFocusNode;
  TextEditingController? ticketDescriptionController;
  String? Function(BuildContext, String?)? ticketDescriptionControllerValidator;
  // State field(s) for statusDropDown widget.
  String? statusDropDownValue;
  FormFieldController<String>? statusDropDownValueController;
  // State field(s) for priorityDropDown widget.
  String? priorityDropDownValue;
  FormFieldController<String>? priorityDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ticketNameFocusNode?.dispose();
    ticketNameController?.dispose();

    ticketDescriptionFocusNode?.dispose();
    ticketDescriptionController?.dispose();
  }
}
