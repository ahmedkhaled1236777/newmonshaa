import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/expenses.dart/presentation/viewmodel/expense/expenses_cubit.dart';
import 'package:ghhg/features/expenses.dart/presentation/views/addexpensewithscafold.dart';
import 'package:ghhg/features/expenses.dart/presentation/views/customtableexpense.dart';
import 'package:ghhg/features/expenses.dart/presentation/views/expensesearch.dart';
import 'package:ghhg/features/home/presentation/views/widgets/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class mobileexpenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Color(0xff415769),
            appBar: AppBar(
              leading: BackButton(
                color: Colors.white,
              ),
              title: Text(
                'المصروفات',
                style: TextStyle(
                    color: Colors.white, fontSize: Appsizes.mappBarsize),
              ),
              centerTitle: true,
              backgroundColor: Color(0xff415769),
              actions: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<expenseCubit>(context)
                              .queryParameters = null;

                          BlocProvider.of<expenseCubit>(context)
                              .getallexpenses(token: generaltoken, page: 1);
                        },
                        icon: const Icon(
                          Icons.refresh,
                          color: Appcolors.whitecolor,
                        )),
                    expensesearch(),
                    const SizedBox(
                      width: Appsizes.size10,
                    ),
                  ],
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigateto(
                    navigationscreen: addexpensewithscafold(),
                    context: context);
              },
              backgroundColor: Color(0xffBF4F51),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [customtableexpenses(MediaQuery.sizeOf(context).width)],
            )),
      );
    });
  }
}
