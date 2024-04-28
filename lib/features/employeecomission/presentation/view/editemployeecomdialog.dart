import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/customchoosedate.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarstate.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/features/employeecomission/data/models/employeecommodel/datum.dart';
import 'package:ghhg/features/employeecomission/data/models/employeecommodelrequest.dart';
import 'package:ghhg/features/employeecomission/presentation/viewmodel/employeecomcuibt/employeecocuibt.dart';
import 'package:ghhg/features/employeecomission/presentation/viewmodel/employeecomcuibt/employeecomstate.dart';

class editemployeecomdialog extends StatefulWidget {
  final double width;
  final double height;
  final Datum data;
  final TextEditingController amount;
  final TextEditingController adress;
  final TextEditingController tenantname;
  final TextEditingController ownername;

  const editemployeecomdialog(
      {super.key,
      required this.width,
      required this.height,
      required this.data,
      required this.amount,
      required this.adress,
      required this.tenantname,
      required this.ownername});

  @override
  State<editemployeecomdialog> createState() => _editemployeecomdialogState(
      amount: amount,
      adress: adress,
      tenantname: tenantname,
      ownername: ownername);
}

class _editemployeecomdialogState extends State<editemployeecomdialog> {
  static final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController amount;
  final TextEditingController adress;
  final TextEditingController tenantname;
  final TextEditingController ownername;

  _editemployeecomdialogState(
      {required this.amount,
      required this.adress,
      required this.tenantname,
      required this.ownername});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<employeecomCubit, employeecomState>(
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
                  "images/mmm.png",
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Text('تعديل عمولة الموظف',
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
                         BlocBuilder<addaqarcuibt, addaqarstate>(
                          builder: (context, state) {
                            return dropdownbutton(
                                items: BlocProvider.of<addaqarcuibt>(context)
                                            .allemployeesmodel ==
                                        null
                                    ? []
                                    : BlocProvider.of<addaqarcuibt>(context)
                                        .allemployeesmodel!
                                        .data!
                                        .map((e) => e.name!)
                                        .toList(),
                                hint: "اسم الموظف",
                                name: BlocProvider.of<addaqarcuibt>(context)
                                    .employeename,
                                onchanged: (val) {
                                  BlocProvider.of<addaqarcuibt>(context)
                                      .changeemployeename(val);
                                },
                              );
                           }
                         ),
                          SizedBox(height: 10,),
                      custommytextform(
                         inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp("[0-9-.]")),
  ], 
                                                            keyboardType: TextInputType.number,

                          val: "برجاء ادخال المبلغ",
                          controller: amount,
                          hintText: "المبلغ"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          val: "برجاء ادخال عنوان العقار",
                          controller: adress,
                          hintText: "عنوان العقار"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          val: "برجاء ادخال اسم المستأجر",
                          controller: tenantname,
                          hintText: "اسم المستأجر"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          val: "برجاء ادخال اسم المالك",
                          controller: ownername,
                          hintText: "اسم المالك"),
                      const SizedBox(
                        height: 10,
                      ),
                     BlocBuilder<employeecomCubit, employeecomState>(
                  builder: (context, state) {
                    return dropdownbutton(
                        onchanged: (val) {
                          BlocProvider.of<employeecomCubit>(context)
                              .changedesctype(val);
                        },
                        items: [ "عمولة عقد ايجار", "عمولة عقد بيع"],
                        name: BlocProvider.of<employeecomCubit>(context).desctype,
                        hint: "الوصف");
                  },
                ),
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
                BlocConsumer<employeecomCubit, employeecomState>(
                  listener: (context, state) {
                    if (state is editemployeecomfailure) {
showdialogerror(error: state.error_message, context: context);
                    }
                    if (state is editemployeecomsuccess) {
                      widget.amount.clear();
                      widget.tenantname.clear();
                      widget.adress.clear();
                      widget.ownername.clear();
                          BlocProvider.of<addaqarcuibt>(context).clearemployeename();

                      BlocProvider.of<employeecomCubit>(context).cleardesctype();
                      BlocProvider.of<DateCubit>(context).date1 = "التاريخ";
                     Navigator.pop(context);
  BlocProvider.of<employeecomCubit>(context)
        .getallemployeecoms(token: generaltoken, page: 1);
                      showsnack(
                          comment: state.success_message, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is editemployeecomloading) return loading();
                    return custommaterialbutton(
                        onPressed: () async {
                      
                          BlocProvider.of<employeecomCubit>(context).updateemployeecom(
                              token: generaltoken,
                              id: widget.data.id!.toInt(),
                              employeecommodel: employeecommodelrequest(
                                employeeid:  BlocProvider.of<addaqarcuibt>(context)
                                          .employeeid!,
                                  ownername: ownername.text,
                                  tenantname: tenantname.text,
                                  adress: adress.text,
                                  totalmoney: amount.text,
                                  desc:
                                      BlocProvider.of<employeecomCubit>(context)
                                          .desctype!,
                                  date: BlocProvider.of<DateCubit>(context)
                                      .date1));
                        },
                        button_name: "تعديل عمولة الموظف",
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
