import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/customtextform.dart';
import 'package:ghhg/features/auth/profile/presentation/view/widgets/customdescription.dart';
import 'package:ghhg/features/tenants/presentation/viewmodel/tenants/tenant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class showtenantdialog extends StatelessWidget {
  final int index;
  final Widget child;
  const showtenantdialog({super.key, required this.index, required this.child});
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
                        'بيانات المستاجر',
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
                          EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff2BA4C8), width: 0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'اسم المستاجر: ${BlocProvider.of<TenantCubit>(context).tenantdata[index].name}',
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
                        'العنوان: ${BlocProvider.of<TenantCubit>(context).tenantdata[index].cardAddress}',
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
                        'رقم الهاتف: ${BlocProvider.of<TenantCubit>(context).tenantdata[index].phone}',
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
                        'رقم البطاقة: ${BlocProvider.of<TenantCubit>(context).tenantdata[index].cardNumber}',
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
                        'الوظيفة: ${BlocProvider.of<TenantCubit>(context).tenantdata[index].jobTitle}',
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
                        'الجنسية: ${BlocProvider.of<TenantCubit>(context).tenantdata[index].nationality}',
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
                        'التاريخ: ${BlocProvider.of<TenantCubit>(context).tenantdata[index].createdAt}',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12.5, color: Colors.black87),
                      ),
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
