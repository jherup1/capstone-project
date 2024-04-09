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
  // State field(s) for ownerName widget.
  FocusNode? ownerNameFocusNode;
  TextEditingController? ownerNameController;
  String? Function(BuildContext, String?)? ownerNameControllerValidator;
  // State field(s) for assigneName widget.
  FocusNode? assigneNameFocusNode;
  TextEditingController? assigneNameController;
  String? Function(BuildContext, String?)? assigneNameControllerValidator;
  // State field(s) for ticketDescription widget.
  FocusNode? ticketDescriptionFocusNode;
  TextEditingController? ticketDescriptionController;
  String? Function(BuildContext, String?)? ticketDescriptionControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ticketNameFocusNode?.dispose();
    ticketNameController?.dispose();

    ownerNameFocusNode?.dispose();
    ownerNameController?.dispose();

    assigneNameFocusNode?.dispose();
    assigneNameController?.dispose();

    ticketDescriptionFocusNode?.dispose();
    ticketDescriptionController?.dispose();
  }
}
