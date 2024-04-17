import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class choosedaterevenue extends StatefulWidget {
  @override
  State<choosedaterevenue> createState() => _choosedaterevenueState();
}

class _choosedaterevenueState extends State<choosedaterevenue> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateCubit, DateState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
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
                    BlocProvider.of<DateCubit>(context).changedate6(context);
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      BlocProvider.of<DateCubit>(context).date6,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w100),
                    ),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
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
                    BlocProvider.of<DateCubit>(context).changedate7(context);
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      BlocProvider.of<DateCubit>(context).date7,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w100),
                    ),
                  )),
            ),
          ],
        );
      },
    );
  }
}
