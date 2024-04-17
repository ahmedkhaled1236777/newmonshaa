import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class customradios extends StatefulWidget {
  @override
  State<customradios> createState() => _customradiosState();
}

class _customradiosState extends State<customradios> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<contractCubit, contractState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "تحصيل الايجار من خلال",
                style: Appstyles.textStyle12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                      value: "owner",
                      groupValue:
                          BlocProvider.of<contractCubit>(context).havemoney,
                      onChanged: (value) {
                        BlocProvider.of<contractCubit>(context)
                            .getmoney(value!);
                      }),
                  Text(
                    "المالك",
                    style: Appstyles.textStyle12,
                  ),
                  Spacer(),
                  Radio(
                      value: "company",
                      groupValue:
                          BlocProvider.of<contractCubit>(context).havemoney,
                      onChanged: (value) {
                        BlocProvider.of<contractCubit>(context)
                            .getmoney(value!);
                      }),
                  Text(
                    "الشركه",
                    style: Appstyles.textStyle12,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
