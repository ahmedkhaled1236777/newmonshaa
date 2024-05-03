import 'package:flutter/services.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/core/commn/widgets/customchoosedate.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/expenses.dart/data/models/expensesmodelrequest.dart';
import 'package:ghhg/features/expenses.dart/presentation/viewmodel/expense/expenses_cubit.dart';
import 'package:ghhg/features/expenses.dart/presentation/viewmodel/expense/expenses_state.dart';
import 'package:ghhg/features/expenses.dart/presentation/views/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghhg/core/commn/sound.dart';

class addexpense extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final double width;

  addexpense({super.key, required this.formkey, required this.width});

  @override
  State<addexpense> createState() => _addexpenseState();
}

class _addexpenseState extends State<addexpense> {
  TextEditingController amount = TextEditingController();

  TextEditingController descreption = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<DateCubit>(context).cleardates();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        width: widget.width,
        color: Colors.white,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
        child: Form(
            key: widget.formkey,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/give.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('تسجيل المصروفات',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2ba4c8),
                        fontWeight: FontWeight.w100),
                    textAlign: TextAlign.right),
                const SizedBox(
                  height: 15,
                ),
                custommytextform(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9-.]")),
                  ],
                  keyboardType: TextInputType.number,
                  controller: amount,
                  hintText: "المبلغ",
                  val: "برجاء ادخال المبلغ",
                ),
                const SizedBox(
                  height: 10,
                ),
                custommytextform(
                  maxlines: 3,
                  controller: descreption,
                  hintText: "الوصف مثل..فاتوره..مرتب",
                  val: "برجاء ادخال الوصف مثل..فاتوره..مرتب",
                ),
                const SizedBox(
                  height: 10,
                ),
                choosedate(),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocConsumer<expenseCubit, expenseState>(
                  listener: (context, state) async {
                    if (state is Addexpensefailure)
                      showsnack(comment: state.error_message, context: context);
                    if (state is Addexpensesuccess) {
                      sound.playsound();
                      amount.clear();
                      descreption.clear();
                      BlocProvider.of<DateCubit>(context).date1 = "التاريخ";
                      MediaQuery.sizeOf(context).width > 950
                          ? navigateandfinish(
                              navigationscreen: expenses(), context: context)
                          : {
                              await BlocProvider.of<expenseCubit>(context)
                                  .getallexpenses(token: generaltoken, page: 1),
                              Navigator.pop(context),
                            };
                      navigateandfinish(
                          navigationscreen: expenses(), context: context);
                      showsnack(
                          comment: state.success_message, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is Addexpenseloading) return loading();
                    return custommaterialbutton(
                        onPressed: () async {
                          if (widget.formkey.currentState!.validate()) {
                            if (BlocProvider.of<DateCubit>(context).date1 ==
                                "التاريخ") {
                              showdialogerror(
                                  error: "برجاء اختيار التاريخ",
                                  context: context);
                            } else {
                              await BlocProvider.of<expenseCubit>(context)
                                  .addexpense(
                                      token: generaltoken,
                                      expense: expensesmodelrequest(
                                          type: "expense",
                                          amount: amount.text,
                                          description: descreption.text,
                                          date: BlocProvider.of<DateCubit>(
                                                  context)
                                              .date1));
                            }
                          }
                        },
                        button_name: "تسجيل البيانات",
                        buttonicon: Icons.send);
                  },
                )
              ],
            ))));
  }

  @override
  void dispose() {
    amount.dispose();

    descreption.dispose();
    super.dispose();
  }
}
