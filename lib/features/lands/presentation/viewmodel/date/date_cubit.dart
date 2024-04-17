import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'date_state.dart';

class DatelandCubit extends Cubit<DatelandState> {
  DateTime selectedDate = DateTime.now();
  String date1 = "التاريخ";

  DateTime selectedDate1 = DateTime.now();
  DatelandCubit() : super(DatelandInitial());
  changedate(BuildContext context) async {
    emit(newchangeDatelandState());
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
    if (date != null) {
      selectedDate = date;
      String month = date.month > 9 ? '${date.month}' : '0${date.month}';
      String day = date.day > 9 ? '${date.day}' : '0${date.day}';
      date1 = '${date.year}-${month}-${day}';
    }
    ;
    emit(changeDatelandState());
  }
}
