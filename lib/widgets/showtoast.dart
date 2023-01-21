import 'package:flutter/material.dart';


showToast(String message, {required Color color}) {
  SnackBar(

    content: Text('dfjkgvdvj'),);
}

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.grey,
    prefixIcon: Icon(icon, color:Colors.blue),
    hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    enabledBorder: myinputborder(),
    focusedBorder: myfocusborder(),
    border: OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Colors.redAccent,
          width: 1,
        )
    ),
  );
}

OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
  return OutlineInputBorder( //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        color: Colors.white60,
        style:BorderStyle.none,
        width: 1,
      )
  );
}

OutlineInputBorder myfocusborder(){
  return OutlineInputBorder( //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        color: Colors.blue.shade50,
        width: 1,
      )
  );

}

CheckIsNotNull(var fromvalue) {
  bool isnull=false;
  if (fromvalue != null||fromvalue!="null"||fromvalue!=" "||fromvalue!="") {
    isnull=true;
    return isnull;
  }
  return isnull;
}

InputDecoration buildInputDecorationDetails(String hintText, IconData icon) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.green,
    prefixIcon: Icon(icon, color:Colors.grey),
    hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    enabledBorder: myinputborder(),
    focusedBorder: myfocusborder(),
    border: OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Colors.redAccent,
          width: 1,
        )
    ),
  );
}