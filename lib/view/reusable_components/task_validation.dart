
import 'package:flutter/material.dart';

class TaskValidation extends StatefulWidget {
  const TaskValidation({Key? key}) : super(key: key);

  @override
  State<TaskValidation> createState() => _TaskValidationState();
}

class _TaskValidationState extends State<TaskValidation> {
  String textValidation = '';
  bool textValidationColor=false;
  List textValidationColor1=[
    Colors.redAccent,
    Colors.green,
    Colors.black12,
    Colors.blue
  ];
  int index=0;
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextFormField(
            onChanged: (pass) {
              passwordValidation(pass);
              setState(() {
                if(textValidation=='password must be more than 6'||textValidation=='enter number'){
                 index=0;
                }else if(textValidation=='Normal'){
                 index=1;
                }else if(textValidation=='medium'){
                 index=2;
                }else if(textValidation=='strong'){
                  index=3;
                }


                // if(textValidation=='password must be more than 6'){
                //   textValidationColor=false;
                // }else{
                //   textValidationColor=true;
                // }
              });
            },
          ),
          Text(textValidation,
          style: TextStyle(
             color: textValidationColor1[index],
          ),),
        ],
      ),
    );
  }

  int checkPasswordStrong(String password) {
    int strength = 0;
    RegExp first = RegExp(r'^(?=.*?[A-Z])');
    RegExp second = RegExp(r'^(?=.*[0-9].*[0-9])');
    RegExp third = RegExp(r'^(?=.*[!@#$&*])');

    if (first.hasMatch(password)) {
      strength++;
    }
    if (second.hasMatch(password)) {
      strength++;
    }
    if (third.hasMatch(password)) {
      strength++;
    }
    return strength;
  }

  String getLevelAsString(int levelNumber) {
    switch (levelNumber) {
      case 1:
        return 'Normal';
      case 2:
        return 'medium';
      case 3:
        return 'strong';
      default:
        return 'enter number';
    }
  }

  String passwordValidation(String pass) {
    if (pass.length < 6) {
     return textValidation = 'password must be more than 6';
    } else {
     return textValidation = getLevelAsString(checkPasswordStrong(pass));
    }
  }

}
