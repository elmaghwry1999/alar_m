import 'package:equatable/equatable.dart';

class AlarmModel extends Equatable {
  int? id;
  String alarmTime;
  String timeNow;
  String alarmDate;
  String dateNow;
  bool isActive;

  AlarmModel(
      {this.id,
      required this.alarmTime,
      required this.timeNow,
      required this.alarmDate,
      required this.dateNow,
      required this.isActive});

  @override
  // TODO: implement props
  List<Object?> get props => [id,alarmTime,timeNow,alarmDate,dateNow,isActive];

  Map<String, dynamic> toMap() {
    return {
      "alarmTime": alarmTime,
      "timeNow": timeNow,
      "alarmDate": alarmDate,
      "dateNow": dateNow,
      "isActive": isActive,
    };
  }
}
