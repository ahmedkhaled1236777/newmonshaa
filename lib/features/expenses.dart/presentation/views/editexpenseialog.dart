import 'package:flutter/services.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/core/commn/widgets/customchoosedate.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/expenses.dart/data/models/expensemodel/datum.dart';
import 'package:ghhg/features/expenses.dart/data/models/expensemodelupdate.dart';
import 'package:ghhg/features/expenses.dart/presentation/viewmodel/expense/expenses_cubit.dart';
import 'package:ghhg/features/expenses.dart/presentation/viewmodel/expense/expenses_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class editexpensedialog extends StatefulWidget {
  final double width;
  final double height;
  final Datum data;
  final TextEditingController amount;
  final TextEditingController descreption;

  editexpensedialog({
    super.key,
    required this.width,
    required this.height,
    required this.data,
    required this.amount,
    required this.descreption,
  });

  @override
  State<editexpensedialog> createState() =>
      _editexpensedialogState(amount: amount, descreption: descreption);
}

class _editexpensedialogState extends State<editexpensedialog> {
  static final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController amount;
  final TextEditingController descreption;

  _editexpensedialogState({required this.amount, required this.descreption});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<expenseCubit, expenseState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: Appsizes.size20,
                ),
                Image.asset(
                  'images/give.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Text('تعديل المصروفات',
                    style: Appstyles.textStyle12
                        .copyWith(color: Appcolors.bluecolor),
                    textAlign: TextAlign.right),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      custommytextform(
                          readonly: cashhelper.getdata(key: "role") != "manager"
                              ? true
                              : false,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp("[0-9-.]")),
                          ],
                          keyboardType: TextInputType.number,
                          val: "برجاء ادخال المبلغ",
                          controller: amount,
                          hintText: "المبلغ"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          maxlines: 5,
                          val: "برجاء ادخال الوصف",
                          controller: descreption,
                          hintText: "الوصف"),
                      const SizedBox(
                        height: 10,
                      ),
                      choosedate(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                BlocConsumer<expenseCubit, expenseState>(
                  listener: (context, state) async {
                    if (state is editexpensefailure) {
                      showdialogerror(
                          error: state.error_message, context: context);
                    }
                    if (state is editexpensesuccess) {
                      BlocProvider.of<DateCubit>(context).date1 = "التاريخ";
                      await BlocProvider.of<expenseCubit>(context)
                          .getallexpenses(token: generaltoken, page: 1);
                      Navigator.pop(context);

                      showsnack(
                          comment: state.success_message, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is editexpenseloading) return loading();
                    return custommaterialbutton(
                        onPressed: () async {
                          BlocProvider.of<expenseCubit>(context).updateexpense(
                              token: generaltoken,
                              id: widget.data.id!.toInt(),
                              expensemodel: expensesmodelupdaterequest(
                                  amount: amount.text,
                                  description: descreption.text,
                                  date: BlocProvider.of<DateCubit>(context)
                                      .date1));
                        },
                        button_name: "تعديل المصروف",
                        buttonicon: Icons.edit);
                  },
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
