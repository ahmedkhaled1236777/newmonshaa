import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateTime selectedDate = DateTime.now();
  String date1 = "التاريخ";
  String date2 = "التاريخ";
  String date3 = "الايجار من";
  String date4 = "الايجار الي";
  String date5 = "تاريخ المعاينه";
  String date6 = "التاريخ من";
  String date7 = "التاريخ الي";
  String time = "وقت المعاينه";

  TimeOfDay selectedtime1 = TimeOfDay.now();
  DateCubit() : super(DateInitial());
  changedate(BuildContext context) async {
    
    selectedDate = DateTime.now();
    emit(newchangedatestate());
    DateTime? date = await showDatePicker(
     
      switchToCalendarEntryModeIcon: Icon(Icons.calendar_month),
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000),
        locale: Locale('ar'));

    if (date != null) {
      selectedDate = date;
      String month = date.month > 9 ? '${date.month}' : '0${date.month}';
      String day = date.day > 9 ? '${date.day}' : '0${date.day}';

      date1 = '${date.year}-${month}-${day}';
    }
    ;
    emit(changedatestate());
  }

  changedate2(BuildContext context) async {
    selectedDate = DateTime.now();
    emit(newchangedatestate());

    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000),
        locale: Locale('ar'));

    if (date != null) {
      selectedDate = date;
      String month = date.month > 9 ? '${date.month}' : '0${date.month}';
      String day = date.day > 9 ? '${date.day}' : '0${date.day}';

      date2 = '${date.year}-${month}-${day}';
    }

    emit(changedatestate());
  }

  changedate3(BuildContext context) async {
    selectedDate = DateTime.now();
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000),
        locale: Locale('ar'));

    if (date != null) {
      selectedDate = date;
      String month = date.month > 9 ? '${date.month}' : '0${date.month}';
      String day = date.day > 9 ? '${date.day}' : '0${date.day}';

      date3 = '${date.year}-${month}-${day}';
    }

    emit(changedatestate());
  }

  changedate4(BuildContext context) async {
    selectedDate = DateTime.now();
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000),
        locale: Locale('ar'));

    if (date != null) {
      selectedDate = date;
      String month = date.month > 9 ? '${date.month}' : '0${date.month}';
      String day = date.day > 9 ? '${date.day}' : '0${date.day}';

      date4 = '${date.year}-${month}-${day}';
    }

    emit(changedatestate());
  }

  changedate5(BuildContext context) async {
    selectedDate = DateTime.now();
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        locale: Locale('ar'),
        lastDate: DateTime(3000));
    if (date != null) {
      selectedDate = date;
      String month = date.month > 9 ? '${date.month}' : '0${date.month}';

      String day = date.day > 9 ? '${date.day}' : '0${date.day}';

      date5 = '${date.year}-${month}-${day}';
    }

    emit(changedatestate());
  }

  changetime(BuildContext context) async {
    TimeOfDay? time1 = await showTimePicker(
        context: context,
        initialTime: selectedtime1,
        initialEntryMode: TimePickerEntryMode.input);

    if (time1 != null) {
      selectedtime1 = time1;
      String hour = time1.hour > 9 ? '${time1.hour}' : '0${time1.hour}';

      String minite = time1.minute > 9 ? '${time1.minute}' : '0${time1.minute}';

      time = "${hour}:${minite}";
    }

    emit(changedatestate());
  }

  changedate7(BuildContext context) async {
    selectedDate = DateTime.now();
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        locale: Locale('ar'),
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
    if (date != null) {
      selectedDate = date;
      String month = date.month > 9 ? '${date.month}' : '0${date.month}';
      String day = date.day > 9 ? '${date.day}' : '0${date.day}';

      date7 = '${date.year}-${month}-${day}';
    }

    emit(changedatestate());
  }

  changedate6(BuildContext context) async {
    selectedDate = DateTime.now();
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        locale: Locale('ar'),
        lastDate: DateTime(3000));
    if (date != null) {
      selectedDate = date;
      String month = date.month > 9 ? '${date.month}' : '0${date.month}';
      String day = date.day > 9 ? '${date.day}' : '0${date.day}';

      date6 = '${date.year}-${month}-${day}';
    }

    emit(changedatestate());
  }

  cleardates() {
    date1 = "التاريخ";
    date2 = "التاريخ";
    date3 = "الايجار من";
    date4 = "الايجار الي";
    date5 = "تاريخ المعاينه";
    date6 = "التاريخ من";
    date7 = "التاريخ الي";
    time = "وقت المعاينه";
    emit(changedatestate());
  }
}
/*  changedate(BuildContext context) async {
    selectedDate = DateTime.now();
    emit(newchangedatestate());
    DateTime? date = await showRoundedDatePicker(
    
    height: 200
    ,
  imageHeader: AssetImage("images/logo.PNG"),
      theme:  ThemeData(
        
        primaryColor: Colors.black.withOpacity(0.3),
        primarySwatch: Colors.blue),
        styleYearPicker: MaterialRoundedYearPickerStyle(
          heightYearRow: 10
        ),
                        styleDatePicker: MaterialRoundedDatePickerStyle(
                          textStyleDayButton: TextStyle(fontSize: 36, color: Colors.white),
                          textStyleYearButton: TextStyle(
                            fontSize: 52,
                            color: Colors.white,
                          ),
                          textStyleDayHeader: TextStyle(
                            fontSize: 24,
                            color: Colors.blue,
                          ),
                          textStyleCurrentDayOnCalendar:
                              TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),
                          textStyleDayOnCalendar: TextStyle(fontSize: 15, color: Colors.black),
                          textStyleDayOnCalendarSelected:
                              TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                          textStyleDayOnCalendarDisabled: TextStyle(fontSize: 28, color: Colors.white.withOpacity(0.1)),
                          textStyleMonthYearHeader:
                              TextStyle(fontSize: 32, color: Colors.green, fontWeight: FontWeight.bold),
                          paddingDatePicker: EdgeInsets.all(10),
                          paddingMonthHeader: EdgeInsets.all(100),
                          paddingActionBar: EdgeInsets.all(100),
                          paddingDateYearHeader: EdgeInsets.symmetric(horizontal: 100),
                          sizeArrow: 25,
                          colorArrowNext: Colors.blue,
                          colorArrowPrevious: Colors.blue,
                          marginLeftArrowPrevious: 5,
                          marginTopArrowPrevious: 16,
                          marginTopArrowNext: 5,
                          marginRightArrowNext: 5,
                          textStyleButtonAction: TextStyle(fontSize: 28, color: Colors.white),
                          textStyleButtonPositive:
                              TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),
                          textStyleButtonNegative: TextStyle(fontSize: 15, color: Colors.blue),
                          decorationDateSelected: BoxDecoration(color:Colors.black.withOpacity(0.3), shape: BoxShape.circle),
                          backgroundPicker: Colors.white,
                          backgroundActionBar: Colors.white,
                        ),
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2020),
  lastDate: DateTime(2100),
  borderRadius: 16,

   locale: Locale('ar'));

    if (date != null) {
      selectedDate = date;
      String month = date.month > 9 ? '${date.month}' : '0${date.month}';
      String day = date.day > 9 ? '${date.day}' : '0${date.day}';

      date1 = '${date.year}-${month}-${day}';
    }
    ;
    emit(changedatestate());

    
  }*/