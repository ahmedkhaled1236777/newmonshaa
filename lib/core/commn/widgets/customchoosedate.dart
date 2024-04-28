import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class choosedate extends StatefulWidget {
  @override
  State<choosedate> createState() => _choosedateState();
}

class _choosedateState extends State<choosedate> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateCubit, DateState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black45, width: 0.5),
              borderRadius: BorderRadius.circular(5)),
          child: TextButton(
              style: TextButton.styleFrom(
                  padding: MediaQuery.sizeOf(context).width > 950
                      ? EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 22,
                        )
                      : EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 12,
                        ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () async {
                BlocProvider.of<DateCubit>(context).changedate(context);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  BlocProvider.of<DateCubit>(context).date1,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w100),
                ),
              )),
        );
      },
    );
  }
}
