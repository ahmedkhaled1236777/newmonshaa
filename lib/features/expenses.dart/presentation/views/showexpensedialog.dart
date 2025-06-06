import 'package:ghhg/features/auth/profile/presentation/view/widgets/customdescription.dart';
import 'package:ghhg/features/expenses.dart/presentation/viewmodel/expense/expenses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class showexpensedialog extends StatelessWidget {
  final int index;
  final Widget child;
  const showexpensedialog(
      {super.key, required this.index, required this.child});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: child,
      onTap: () {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close)),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              content: SingleChildScrollView(
                  child: Container(
                width: MediaQuery.sizeOf(context).width > 950
                    ? MediaQuery.of(context).size.width * 0.25
                    : MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: Text(
                        'بيانات المصروف',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 7),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff2BA4C8), width: 0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'المبلغ : ${BlocProvider.of<expenseCubit>(context).expensedata[index].totalMoney!}',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12.5, color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 7),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff2BA4C8), width: 0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'الوصف : ${BlocProvider.of<expenseCubit>(context).expensedata[index].description}',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12.5, color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 7),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff2BA4C8), width: 0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        ' اسم الموظف : ${BlocProvider.of<expenseCubit>(context).expensedata[index].user!.name!}',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12.5, color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )),
            );
          },
        );
      },
    );
  }
}
