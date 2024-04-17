import 'dart:io';

import 'package:ghhg/features/emoloyees/presentation/viewmodel/addemployee/addemployee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class pikeemployeeimage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xff2BA4C8), width: 0.5)),
      child: MaterialButton(
        padding: EdgeInsets.all(21),
        onPressed: () {
          BlocProvider.of<AddemployeeCubit>(context).uploadimage();
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.image,
              size: 19,
              color: Colors.grey,
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              'صورة الموظف',
              style: TextStyle(fontSize: 12.5, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
