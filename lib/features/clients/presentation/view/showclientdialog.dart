import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/features/clients/presentation/viewmodel/clients/clients_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class showclientsdialog extends StatelessWidget {
  final int index;
  final Widget child;
  const showclientsdialog(
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
                        'بيانات العميل',
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
                        'اسم العميل: ${BlocProvider.of<clientsCubit>(context).clientsdata[index].name}',
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
                        'رقم الهاتف: ${BlocProvider.of<clientsCubit>(context).clientsdata[index].phone}',
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
                        'الحاله: ${clientstatussresponse[BlocProvider.of<clientsCubit>(context).clientsdata[index].status]}',
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
                        'كود الاعلان: ${BlocProvider.of<clientsCubit>(context).clientsdata[index].code}',
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
                        'القسم : ${BlocProvider.of<clientsCubit>(context).showdepartement[BlocProvider.of<clientsCubit>(context).clientsdata[index].department]}',
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
                        'تاريخ المعاينه: ${BlocProvider.of<clientsCubit>(context).clientsdata[index].inspectionDate == null ? "لا يوجد" : BlocProvider.of<clientsCubit>(context).clientsdata[index].inspectionDate}',
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
                        'وقت المعاينه: ${BlocProvider.of<clientsCubit>(context).clientsdata[index].inspectionTime == null ? "لا يوجد" : BlocProvider.of<clientsCubit>(context).clientsdata[index].inspectionTime}',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12.5, color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (BlocProvider.of<clientsCubit>(context)
                            .clientsdata[index]
                            .notes !=
                        null)
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 7),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff2BA4C8), width: 0.5),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'الملاحظات: ${BlocProvider.of<clientsCubit>(context).clientsdata[index].notes}',
                          textAlign: TextAlign.right,
                          style:
                              TextStyle(fontSize: 12.5, color: Colors.black87),
                        ),
                      ),
                    if (BlocProvider.of<clientsCubit>(context)
                            .clientsdata[index]
                            .notes !=
                        null)
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
                        'اسم الموظف : ${BlocProvider.of<clientsCubit>(context).clientsdata[index].employee}',
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
