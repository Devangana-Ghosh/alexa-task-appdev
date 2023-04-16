import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool outlineBtn;
  CustomBtn({required this.text,required this.onPressed,required this.outlineBtn});

  @override
  Widget build(BuildContext context) {
    bool _outlineBtn= outlineBtn ?? false;
    return Material(
      color: _outlineBtn ? Colors.transparent : Colors.black,
      borderRadius: BorderRadius.circular(12.0),
      child: InkWell(
        onTap: onPressed as void Function()?,
        child: Container(
          height:60.0,
          alignment:Alignment.center,
          decoration:BoxDecoration(
            border:Border.all(
              color:Colors.black,
              width:2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin:EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 8.0,
          ),
          child: Text(
            text ?? "Text",
            style:TextStyle(
              fontSize:16.0,
              color: _outlineBtn? Colors.black:Colors.white,
              fontWeight:FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
