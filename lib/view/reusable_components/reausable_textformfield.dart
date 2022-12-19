
import 'package:flutter/material.dart';

Widget MyFormField({
  //datatype namev
  //required TextEditingController C,
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword=false,
  IconData? suffix,
  IconData? prefix,
  String? label,
  Function? suffixPressed,
  Function? onChange,
  GestureTapCallback? onTap,
  Function? onSubmit,
  // required Function validate,
  //datatype name;
  // Function? validate ,
  // FormFieldValidator? validate,
  // int x=5;
  required Function validate,


})=>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      validator:(p)=>validate(p),
      // validator:(s)=>validate(s),
      // onChanged:(value){onChange!(value);},
      onTap: onTap,
      // onFieldSubmitted: (s){
      //   onSubmit!(s);
      // },
      decoration: InputDecoration(
        label: Text(label!),
        prefixIcon: Icon(
            prefix
        ),
        // suffixIcon: suffix!= null ? IconButton(
        //   onPressed: suffixPressed!(),
        //   icon:Icon(suffix)):null,

        border: OutlineInputBorder(),
      ),
    );

