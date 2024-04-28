import 'package:ghhg/core/commn/widgets/customshoosedate.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class choosedateexpense extends StatefulWidget {
  @override
  State<choosedateexpense> createState() => _choosedateexpenseState();
}

class _choosedateexpenseState extends State<choosedateexpense> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateCubit, DateState>(
      builder: (context, state) {
        return Column(
          children: [
            BlocBuilder<DateCubit, DateState>(
              builder: (context, state) {
                return choosedatecontract(
                  date: BlocProvider.of<DateCubit>(context).date6,
                  onPressed: () {
                    BlocProvider.of<DateCubit>(context).changedate6(context);
                  },
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            BlocBuilder<DateCubit, DateState>(
              builder: (context, state) {
                return choosedatecontract(
                  date: BlocProvider.of<DateCubit>(context).date7,
                  onPressed: () {
                    BlocProvider.of<DateCubit>(context).changedate7(context);
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
