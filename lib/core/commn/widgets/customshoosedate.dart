import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class choosedatecontract extends StatelessWidget {
  final void Function()? onPressed;
  final String date;
  const choosedatecontract({super.key, this.onPressed, required this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black45, width: 0.5),
          borderRadius: BorderRadius.circular(5)),
      child: TextButton(
          style: TextButton.styleFrom(
              padding: MediaQuery.sizeOf(context).width > 950
                  ? const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 22,
                    )
                  : const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 12,
                    ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          onPressed: onPressed,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              date,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w100),
            ),
          )),
    );
  }
}
