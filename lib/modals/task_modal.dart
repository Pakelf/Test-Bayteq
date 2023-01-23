import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:poke_api_bayteq/helpers/modal_object.dart';


class TaskModal extends StatefulWidget {
  final String textTaskModal;
  const TaskModal(
    VoidCallback continueCallBack, {
    Key? key, required this.textTaskModal,
  }) : super(key: key);

  @override
  _TaskModalState createState() => _TaskModalState();
}

class _TaskModalState extends State<TaskModal> {

  @override
  Widget build(BuildContext context) {

    return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
    
    child: Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      backgroundColor: Colors.blue.withOpacity(0.1),
      child: ModalObject(textObject: widget.textTaskModal,),
    )
);
  }
}