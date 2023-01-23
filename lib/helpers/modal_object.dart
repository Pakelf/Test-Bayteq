import 'package:flutter/material.dart';
import 'package:poke_api_bayteq/theme/app_theme.dart';

class ModalObject extends StatefulWidget {
  final String textObject;
  const ModalObject({Key? key, required this.textObject}) : super(key: key);

  @override
  _ModalObjectState createState() => _ModalObjectState();
}

class _ModalObjectState extends State<ModalObject> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: (312.4),
          height: (204.3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.45),
            gradient: const LinearGradient(
              begin: Alignment(-0.96, 1.0),
              end: Alignment(0.94, -1.0),
              colors: [AppTheme.amarillo, AppTheme.primary],
              stops: [0.0, 1.0],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x66000000),
                offset: Offset(7, 7),
                blurRadius: 5,
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const SizedBox(
                height: (60),
                width: (45),
                child: Padding(
                  padding: EdgeInsets.only(top: 15, left: 15),
                  child: Icon(Icons.close),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.only(top: (80.0)),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(widget.textObject,
              style: AppTheme.lblTitle),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
