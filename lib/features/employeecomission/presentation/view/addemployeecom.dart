import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/customchoosedate.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarstate.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/features/employeecomission/data/models/employeecommodelrequest.dart';
import 'package:ghhg/features/employeecomission/presentation/view/employeecom.dart';
import 'package:ghhg/features/employeecomission/presentation/viewmodel/employeecomcuibt/employeecocuibt.dart';
import 'package:ghhg/features/employeecomission/presentation/viewmodel/employeecomcuibt/employeecomstate.dart';
import 'package:ghhg/core/commn/sound.dart';

class addemployeecom extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final double width;

  addemployeecom({super.key, required this.formkey, required this.width});

  @override
  State<addemployeecom> createState() => _addemployeecomState();
}

class _addemployeecomState extends State<addemployeecom> {
  TextEditingController amount = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController tenantname = TextEditingController();
  TextEditingController ownername = TextEditingController();
  TextEditingController desc = TextEditingController();
  
  @override
  void initState() {

    BlocProvider.of<DateCubit>(context).cleardates();
    BlocProvider.of<addaqarcuibt>(context).clearemployeename();
    BlocProvider.of<employeecomCubit>(context).cleardesctype();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: widget.width,
        color: Colors.white,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
        child: ListView(
          children: [
            Form(
                key: widget.formkey,
                child: Container(
                                width: MediaQuery.of(context).size.width * 0.27,

                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/mmm.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text('تسجيل عمولة الموظفين',
                          style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff2ba4c8),
                              fontWeight: FontWeight.w100),
                          textAlign: TextAlign.right),
                      const SizedBox(
                        height: 15,
                      ),
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

                        controller: amount,
                        hintText: "المبلغ",
                        val: "برجاء ادخال المبلغ",
                      ),
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
                      custommytextform(
                        controller: adress,
                        hintText: "عنوان العقار",
                        val: "برجاء ادخال عنوان العقار",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                        controller: tenantname,
                        hintText: "اسم المستأجر",
                        val: "برجاء ادخال اسم المستأجر",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                        controller: ownername,
                        hintText: "اسم المالك",
                        val: "برجاء ادخال اسم المالك",
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
                      BlocConsumer<employeecomCubit, employeecomState>(
                        listener: (context, state) async {
                          if (state is Addemployeecomfailure)
                            showsnack(comment: state.error_message, context: context);
                          if (state is Addemployeecomsuccess) {
                              sound.playsound();
                            tenantname.clear();
                            ownername.clear();
                            adress.clear();
                            amount.clear();
                            BlocProvider.of<employeecomCubit>(context).cleardesctype();
                  BlocProvider.of<addaqarcuibt>(context).clearemployeename();
                            BlocProvider.of<DateCubit>(context).date1 = "التاريخ";
                            MediaQuery.sizeOf(context).width > 950
                                ? navigateandfinish(
                                    navigationscreen: employeecoms(), context: context)
                                : {
                                    await BlocProvider.of<employeecomCubit>(context)
                                        .getallemployeecoms(token: generaltoken, page: 1),
                                    Navigator.pop(context),
                                  };
                              
                            showsnack(
                                comment: state.success_message, context: context);
                          }
                        },
                        builder: (context, state) {
                          if (state is Addemployeecomloading) return loading();
                          return custommaterialbutton(
                              onPressed: () async {
                                 if (BlocProvider.of<addaqarcuibt>(context)
                                                .employeeid ==
                                      null) {
                                    showdialogerror(
                                        error: "برجاء اختيار اسم الموظف",
                                        context: context);
                                  } 
                                  else  if (  BlocProvider.of<employeecomCubit>(
                                                            context)
                                                        .desctype ==
                                      null) {
                                    showdialogerror(
                                        error: "برجاء اختيار الوصف",
                                        context: context);
                                  } 
                              else  if (widget.formkey.currentState!.validate()) {
                                  if (BlocProvider.of<DateCubit>(context).date1 ==
                                      "التاريخ") {
                                    showdialogerror(
                                        error: "برجاء اختيار التاريخ",
                                        context: context);
                                  } 
                                else  if ( BlocProvider.of<addaqarcuibt>(context)
                                                .employeeid==null
                                     ) {
                                    showdialogerror(
                                        error: "برجاء اختيار اسم الموظف",
                                        context: context);
                                  }
                                else  if (    BlocProvider.of<employeecomCubit>(
                                                            context)
                                                        .desctype ==null
                                     ) {
                                    showdialogerror(
                                        error: "برجاء اختيار الوصف ",
                                        context: context);
                                  } else {
                                    await BlocProvider.of<employeecomCubit>(context)
                                        .addemployeecom(
                                            token: generaltoken,
                                            employeecom: employeecommodelrequest(
                                                employeeid:  BlocProvider.of<addaqarcuibt>(context)
                                                .employeeid!,
                                                ownername: ownername.text,
                                                tenantname: tenantname.text,
                                                adress: adress.text,
                                                totalmoney: amount.text,
                                                desc:
                                                    BlocProvider.of<employeecomCubit>(
                                                            context)
                                                        .desctype!,
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
                  )),
                )),
          ],
        ));
  }
}
