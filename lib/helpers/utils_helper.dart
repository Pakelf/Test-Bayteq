import 'package:flutter/material.dart';

double sizedWidth(BuildContext context,int porcent){  
  return (MediaQuery.of(context).size.width / (100/porcent));
}

double sizedHeight(BuildContext context,int porcent){  
  return (MediaQuery.of(context).size.height / (100/porcent));
}

void infoprint(dynamic info){
  debugPrint('❕'+info.toString());
}

void errorprint(dynamic info){
  debugPrint('⛔️'+info.toString());
}

void msgAlerta(BuildContext context,String titulo,String msg){
  var alert =AlertDialog(
      title: Row(
        children: [
          Image.asset('assets/imgs/pokeball.gif',height: 50,),
          Text(titulo),
          const Expanded(child: SizedBox())
        ],
      ),
      content: Text(msg),
      actions: [
        TextButton(
          child: const Text("Aceptar"),
          onPressed: () => Navigator.pop(context) 
        ),
      ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}