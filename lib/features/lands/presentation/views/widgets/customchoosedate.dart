import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/date/date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class choosedateland extends StatefulWidget {
  @override
  State<choosedateland> createState() => _choosedatelandState();
}

class _choosedatelandState extends State<choosedateland> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatelandCubit, DatelandState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black45, width: 0.5),
              borderRadius: BorderRadius.circular(5)),
          child: TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 22,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () async {
                BlocProvider.of<DatelandCubit>(context).changedate(context);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  BlocProvider.of<DatelandCubit>(context).date1,
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
