import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class showcontractdialog extends StatelessWidget {
  final int index;
  final Widget child;
  const showcontractdialog(
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
                        'بيانات عقد الايجار',
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
                        'اسم المستاجر: ${BlocProvider.of<contractCubit>(context).contractdata[index].tenant!.name!}',
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
                        'العنوان: ${BlocProvider.of<contractCubit>(context).contractdata[index].tenant!.cardAddress}',
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
                        'رقم الهاتف: ${BlocProvider.of<contractCubit>(context).contractdata[index].tenant!.phone}',
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
                        'رقم بطاقة المستاجر: ${BlocProvider.of<contractCubit>(context).contractdata[index].tenant!.cardNumber}',
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
                        'الوظيفة: ${BlocProvider.of<contractCubit>(context).contractdata[index].tenant!.jobTitle}',
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
                        'الجنسية: ${BlocProvider.of<contractCubit>(context).contractdata[index].tenant!.nationality!}',
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
                        'اسم المالك: ${BlocProvider.of<contractCubit>(context).contractdata[index].ownerName}',
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
                        'رقم هاتف المالك: ${BlocProvider.of<contractCubit>(context).contractdata[index].ownerPhone}',
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
                        'وظيفة المالك: ${BlocProvider.of<contractCubit>(context).contractdata[index].ownerJobTitle}',
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
                        'رقم بطاقة المالك: ${BlocProvider.of<contractCubit>(context).contractdata[index].ownerCardNumber}',
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
                        'عنوان المالك: ${BlocProvider.of<contractCubit>(context).contractdata[index].ownerCardAddress}',
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
                        'جنسية المالك: ${BlocProvider.of<contractCubit>(context).contractdata[index].ownerNationality}',
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
                        'نوع العقار: ${show[BlocProvider.of<contractCubit>(context).contractdata[index].realStateType]}',
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
                        'عنوان العقار: ${BlocProvider.of<contractCubit>(context).contractdata[index].realStateAddress}',
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
                        'عنوان العقار بالتفصيل : ${BlocProvider.of<contractCubit>(context).contractdata[index].realStateAddressDetails}',
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
                        'القسم التابع له العقار : ${BlocProvider.of<contractCubit>(context).contractdata[index].governorate}',
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
                        'مساحة العقار: ${BlocProvider.of<contractCubit>(context).contractdata[index].realStateSpace}',
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
                        'رقم الشقه: ${BlocProvider.of<contractCubit>(context).contractdata[index].apartmentNumber}',
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
                        'رقم العماره: ${BlocProvider.of<contractCubit>(context).contractdata[index].buildingNumber}',
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
                        'التامين: ${BlocProvider.of<contractCubit>(context).contractdata[index].insuranceTotal}',
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
                        'قيمة الايجار: ${BlocProvider.of<contractCubit>(context).contractdata[index].contractTotal}',
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
                        'نوع العموله: ${commessionresponse[BlocProvider.of<contractCubit>(context).contractdata[index].commissionType]}',
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
                        'قيمة العموله: ${BlocProvider.of<contractCubit>(context).contractdata[index].commission}',
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
                        'تاريخ العقد: ${BlocProvider.of<contractCubit>(context).contractdata[index].contractDate}',
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
                        'الايجار من: ${BlocProvider.of<contractCubit>(context).contractdata[index].contractDateFrom}',
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
                        'الايجار الي: ${BlocProvider.of<contractCubit>(context).contractdata[index].contractDateTo}',
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
