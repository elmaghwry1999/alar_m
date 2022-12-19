import 'package:alarm/local/local_data_source.dart';
import 'package:alarm/model/alarm_model.dart';
import 'package:alarm/view/screens/bodyScreen.dart';
import 'package:alarm/view/screens/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../reusable_components/reausable_textformfield.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    bool isActive = false;
    var now = DateTime.now();
    var formattedTime = DateFormat('hh:mm').format(now);
    var timeNow = DateFormat('h:mm a').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var formKey = GlobalKey<FormState>();

    bool isBottomSheet = false;

    var timeController = TextEditingController();

    var dateController = TextEditingController();

    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      body:BodyScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottomSheet==true) {
            if (formKey.currentState!.validate()) {
              print('form Done  ');
              print('form Done  ${ timeController.text}');
              print('form Done  $timeNow');
              LocalDataSource().addAlarm(AlarmModel(alarmTime: timeController.text.toString(), timeNow: formattedTime.toString(), alarmDate: dateController.text.toString(), dateNow: formattedDate.toString(), isActive: isActive));
              print(timeController.text.toString() ==timeNow.toString());
              Navigator.pop(context);
            }
          } else {
            scaffoldKey.currentState!.showBottomSheet(
                  (context) => Container(
                color: Colors.white,
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      MyFormField(
                        controller: timeController,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "Time must not be empty";
                          }
                          return null;
                        },
                        onTap: () {
                          showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now())
                              .then(
                                (value) {
                              timeController.text =
                                  value!.format(context).toString();
                              print(value.format(context));
                            },
                          );
                        },
                        label: "Time",
                        type: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyFormField(
                        controller: dateController,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse('2022-12-15'),
                          ).then((value) {
                            dateController.text =
                                DateFormat.yMMMd().format(value!);
                          });
                        },
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "Date must not be empty";
                          }
                          return null;
                        },
                        label: "Date",
                        type: TextInputType.datetime,
                      ),
                    ],
                  ),
                ),
              ),
              //ui
            );
          }
          isBottomSheet = !isBottomSheet;
        },
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            Icons.add,
            size: 40,
          ),
          decoration: const BoxDecoration(
              color: Color(0xff2D2F41),
              boxShadow: [
                BoxShadow(
                    color:Colors.white,
                    blurRadius:6,
                    spreadRadius: 1)
              ],
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
