import 'package:ghhg/features/contracts/presentation/views/contract.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/sound.dart';

import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/contracts/data/models/contractmodelrequest.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_state.dart';
import 'package:ghhg/features/contracts/presentation/views/customradios.dart';
import 'package:ghhg/features/contracts/presentation/views/customshoosedate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addcontract extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final double width;
  final TextEditingController tenantname;
  final TextEditingController tenanphone;
  final TextEditingController tenantcard;
  final TextEditingController tenantadress;
  final TextEditingController tenantjob;
  final TextEditingController tenantnationality;
  final TextEditingController ownername;
  final TextEditingController ownerphone;
  final TextEditingController ownercard;
  final TextEditingController owneradress;
  final TextEditingController ownerjob;
  final TextEditingController ownernationality;
  final TextEditingController aqaradress;
  final TextEditingController aqaradressdetails;
  final TextEditingController aqarmohafza;
  final TextEditingController area;
  final TextEditingController emaranumber;
  final TextEditingController housenumber;
  final TextEditingController totalvalue;
  final TextEditingController insuranceval;
  final TextEditingController commessionvalue;
  bool? is_edit;
  addcontract({
    super.key,
    required this.formkey,
    this.is_edit = false,
    required this.width,
    required this.tenantname,
    required this.tenanphone,
    required this.tenantcard,
    required this.tenantadress,
    required this.tenantjob,
    required this.tenantnationality,
    required this.ownername,
    required this.ownerphone,
    required this.ownercard,
    required this.owneradress,
    required this.ownerjob,
    required this.ownernationality,
    required this.aqaradress,
    required this.aqaradressdetails,
    required this.aqarmohafza,
    required this.area,
    required this.emaranumber,
    required this.housenumber,
    required this.totalvalue,
    required this.insuranceval,
    required this.commessionvalue,
  });

  @override
  State<addcontract> createState() => _addcontractState();
}

class _addcontractState extends State<addcontract> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
        width: widget.width,
        child: ListView(shrinkWrap: true, children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              width: MediaQuery.of(context).size.width * 0.27,
              child: Container(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(children: [
                        Image.asset(
                          'images/lease.png',
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Text('تسجيل عقد الايجار',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff2ba4c8),
                                  fontWeight: FontWeight.w100),
                              textAlign: TextAlign.right),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Form(
                          key: widget.formkey,
                          child: Column(
                            children: [
                              custommytextform(
                                controller: widget.tenantname,
                                hintText: "اسم المستاجر",
                                val: "  برجاء ادخال اسم المستأجر",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.tenanphone,
                                hintText: "رقم هاتف المستاجر",
                                val: "برجاء ادخال رقم هاتف المستأجر",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.tenantcard,
                                hintText: "رقم بطاقة المستاجر",
                                val: "برجاء ادخال رقم بطاقة المستأجر",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.tenantadress,
                                hintText: "عنوان المستاجر",
                                val: "برجاء ادخال عنوان المستأجر",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.tenantjob,
                                hintText: "وظيفة المستأجر",
                                val: "برجاء ادخال وظيفة المستأجر",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.tenantnationality,
                                hintText: "جنسية المستاجر",
                                val: "برجاء ادخال جنيبة المستأجر",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.ownername,
                                hintText: "اسم المالك",
                                val: "برجاء ادخال اسم المالك",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.ownerphone,
                                hintText: "رقم هاتف المالك",
                                val: "برجاء ادخال رقم هاتف المالك",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.ownerjob,
                                hintText: "وظيفة المالك",
                                val: "برجاء ادخال وظيفة المالك",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.ownercard,
                                hintText: "رقم بطاقة المالك",
                                val: "برجاء ادخال رقم بطاقة المالك",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.owneradress,
                                hintText: "عنوان المالك",
                                val: "برجاء ادخال  عنوان المالك",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.ownernationality,
                                hintText: "جنسية المالك",
                                val: "برجاء ادخال جنسية المالك",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              BlocBuilder<contractCubit, contractState>(
                                builder: (context, state) {
                                  return dropdownbutton(
                                    items: [
                                      "فيلا فارغه",
                                      "شقه فارغه",
                                      "شقه مفروشه",
                                      "فيلا مفروشه",
                                      "محل"
                                    ],
                                    hint: "نوع العقار",
                                    name:
                                        BlocProvider.of<contractCubit>(context)
                                            .aqartype,
                                    onchanged: (val) {
                                      BlocProvider.of<contractCubit>(context)
                                          .changeaddaqartype(val);
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.aqaradress,
                                hintText: "عنوان العقار",
                                val: "برجاء ادخال عنوان العقار",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.aqarmohafza,
                                hintText: "المحافظه التابع لها العقار",
                                val: "برجاء ادخال المحافظه التابع لها العقار",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.aqaradressdetails,
                                hintText: "عنوان العقار بالتفصيل",
                                val: "برجاء ادخال لمحافظه التابع لها العقار",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.area,
                                hintText: " مساخة العقار",
                                val: "برجاء ادخال مساحة العقار",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.emaranumber,
                                hintText: "رقم العماره",
                                val: "برجاء ادخال رقم العماره",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.housenumber,
                                hintText: "رقم الشقه",
                                val: "برجاء ادخال رقم الشقه",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              BlocBuilder<DateCubit, DateState>(
                                builder: (context, state) {
                                  return choosedatecontract(
                                    date: BlocProvider.of<DateCubit>(context)
                                        .date1,
                                    onPressed: () {
                                      BlocProvider.of<DateCubit>(context)
                                          .changedate(context);
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              BlocBuilder<DateCubit, DateState>(
                                builder: (context, state) {
                                  return choosedatecontract(
                                    date: BlocProvider.of<DateCubit>(context)
                                        .date3,
                                    onPressed: () {
                                      BlocProvider.of<DateCubit>(context)
                                          .changedate3(context);
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              BlocBuilder<DateCubit, DateState>(
                                builder: (context, state) {
                                  return choosedatecontract(
                                    date: BlocProvider.of<DateCubit>(context)
                                        .date4,
                                    onPressed: () {
                                      BlocProvider.of<DateCubit>(context)
                                          .changedate4(context);
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.insuranceval,
                                hintText: "التأمين",
                                val: "برجاء ادخال قيمة التامين",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                controller: widget.totalvalue,
                                hintText: "قيمة الايجار",
                                val: "برجاء ادخال قيمة الايجار",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              BlocBuilder<contractCubit, contractState>(
                                builder: (context, state) {
                                  return dropdownbutton(
                                      onchanged: (val) {
                                        BlocProvider.of<contractCubit>(context)
                                            .changecommessiontype(val);
                                      },
                                      items: ["نسبه", "عموله"],
                                      name: BlocProvider.of<contractCubit>(
                                              context)
                                          .commessiontype,
                                      hint: "نوع العموله");
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              BlocBuilder<contractCubit, contractState>(
                                builder: (context, state) {
                                  return custommytextform(
                                    controller: widget.commessionvalue,
                                    hintText:
                                        BlocProvider.of<contractCubit>(context)
                                                    .commessiontype ==
                                                "نسبه"
                                            ? "قيمة النسبه في المئه"
                                            : "قيمة العموله",
                                    val: "برجاء ادخال قيمة العموله",
                                  );
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        customradios(),
                        SizedBox(
                          height: 15,
                        ),
                        if (widget.is_edit == false)
                          BlocConsumer<contractCubit, contractState>(
                            listener: (context, state) {
                              if (state is Addcontractfailure)
                                showsnack(
                                    comment: state.error_message,
                                    context: context);
                              if (state is Addcontractsuccess) {
                                sound.playsound();
                                showsnack(
                                    comment: state.success_message,
                                    context: context);

                                BlocProvider.of<contractCubit>(context)
                                    .cleardata();
                                BlocProvider.of<DateCubit>(context).date1 =
                                    "التاريخ";
                                BlocProvider.of<DateCubit>(context).date3 =
                                    "الايجار من";
                                BlocProvider.of<DateCubit>(context).date4 =
                                    "الايجار الي";

                                navigateandfinish(
                                    navigationscreen: Contract(
                                        tenantname: TextEditingController(),
                                        tenanphone: TextEditingController(),
                                        tenantcard: TextEditingController(),
                                        tenantadress: TextEditingController(),
                                        tenantjob: TextEditingController(),
                                        tenantnationality:
                                            TextEditingController(),
                                        ownername: TextEditingController(),
                                        ownerphone: TextEditingController(),
                                        ownercard: TextEditingController(),
                                        owneradress: TextEditingController(),
                                        ownerjob: TextEditingController(),
                                        ownernationality:
                                            TextEditingController(),
                                        aqaradress: TextEditingController(),
                                        aqaradressdetails:
                                            TextEditingController(),
                                        aqarmohafza: TextEditingController(),
                                        aqartype: TextEditingController(),
                                        area: TextEditingController(),
                                        emaranumber: TextEditingController(),
                                        housenumber: TextEditingController(),
                                        totalvalue: TextEditingController(),
                                        insuranceval: TextEditingController(),
                                        commessionvalue:
                                            TextEditingController(),
                                        periodofdelay: TextEditingController()),
                                    context: context);
                              }
                            },
                            builder: (context, state) {
                              if (state is Addcontractloading) return loading();
                              return custommaterialbutton(
                                  onPressed: () {
                                    if (widget.formkey.currentState!
                                        .validate()) {
                                      if (BlocProvider.of<DateCubit>(context)
                                              .date1 ==
                                          "التاريخ") {
                                        showdialogerror(
                                            error: "برجاء ادخال التاريخ",
                                            context: context);
                                      } else if (BlocProvider.of<DateCubit>(
                                                  context)
                                              .date3 ==
                                          "الايجار من") {
                                        showdialogerror(
                                            error:
                                                "برجاء ادخال تاريخ الايجار من",
                                            context: context);
                                      } else if (BlocProvider.of<DateCubit>(
                                                  context)
                                              .date4 ==
                                          "الايجار الي") {
                                        showdialogerror(
                                            error:
                                                "برجاء ادخال تاريخ الايجار الي",
                                            context: context);
                                      }
                                      if (true) {
                                        BlocProvider.of<contractCubit>(context)
                                            .addcontract(
                                                id: BlocProvider.of<
                                                        contractCubit>(context)
                                                    .id,
                                                token: generaltoken,
                                                contract: contractmodelrequest(
                                                  havemoney: BlocProvider.of<
                                                              contractCubit>(
                                                          context)
                                                      .havemoney!,
                                                  tenant_name:
                                                      widget.tenantname.text,
                                                  tenant_cardnumber:
                                                      widget.tenantcard.text,
                                                  tenant_phone:
                                                      widget.tenanphone.text,
                                                  tenant_adress:
                                                      widget.tenantadress.text,
                                                  tenant_job:
                                                      widget.tenantjob.text,
                                                  tenant_nationality: widget
                                                      .tenantnationality.text,
                                                  owner_name:
                                                      widget.ownername.text,
                                                  owner_cardnumber:
                                                      widget.ownercard.text,
                                                  owner_phone:
                                                      widget.ownerphone.text,
                                                  owner_adress:
                                                      widget.owneradress.text,
                                                  owner_job:
                                                      widget.ownerjob.text,
                                                  owner_nationality: widget
                                                      .ownernationality.text,
                                                  aqar_adress:
                                                      widget.aqaradress.text,
                                                  governrate:
                                                      widget.aqarmohafza.text,
                                                  aqar_type: request[BlocProvider
                                                          .of<contractCubit>(
                                                              context)
                                                      .aqartype!],
                                                  area: widget.area.text,
                                                  aqaradressdetails: widget
                                                      .aqaradressdetails.text,
                                                  emaranumber:
                                                      widget.emaranumber.text,
                                                  flatnumber:
                                                      widget.housenumber.text,
                                                  date: BlocProvider.of<
                                                          DateCubit>(context)
                                                      .date1,
                                                  contractfrom: BlocProvider.of<
                                                          DateCubit>(context)
                                                      .date3,
                                                  contractto: BlocProvider.of<
                                                          DateCubit>(context)
                                                      .date4,
                                                  contractvalue:
                                                      widget.totalvalue.text,
                                                  commission_type:
                                                      commessionrequest[BlocProvider
                                                              .of<contractCubit>(
                                                                  context)
                                                          .commessiontype],
                                                  commission: BlocProvider.of<
                                                                      contractCubit>(
                                                                  context)
                                                              .commessiontype ==
                                                          "نسبه"
                                                      ? (double.parse(widget
                                                                  .commessionvalue
                                                                  .text) /
                                                              100 *
                                                              double.parse(widget
                                                                  .totalvalue
                                                                  .text))
                                                          .toString()
                                                      : widget
                                                          .commessionvalue.text,
                                                  insurance_total:
                                                      widget.insuranceval.text,
                                                ));
                                      }
                                    }
                                  },
                                  button_name: "تسجيل البيانات",
                                  buttonicon: Icons.send);
                            },
                          ),
                        if (widget.is_edit == true)
                          BlocConsumer<contractCubit, contractState>(
                              listener: (context, state) async {
                            if (state is editcontractfailure) {
                              showsnack(
                                  comment: state.error_message,
                                  context: context);
                            }
                            if (state is editcontractsuccess) {
                              BlocProvider.of<contractCubit>(context)
                                  .queryParameters = null;
                              await BlocProvider.of<contractCubit>(context)
                                  .getallcontracts(
                                      token: generaltoken, page: 1);
                              BlocProvider.of<contractCubit>(context)
                                  .mycleardata(context);

                              Navigator.pop(context);

                              // ignore: use_build_context_synchronously
                              showsnack(
                                  comment: state.success_message,
                                  context: context);
                            }
                          }, builder: (context, state) {
                            if (state is editcontractloading) return loading();
                            return custommaterialbutton(
                              button_name: "تعديل البيانات",
                              buttonicon: Icons.edit,
                              onPressed: () {
                                BlocProvider.of<contractCubit>(context)
                                    .updatecontract(
                                        id: BlocProvider.of<contractCubit>(
                                                context)
                                            .id!,
                                        token: generaltoken,
                                        contractmodel: contractmodelrequest(
                                          havemoney:
                                              BlocProvider.of<contractCubit>(
                                                      context)
                                                  .havemoney!,
                                          tenant_name: widget.tenantname.text,
                                          tenant_cardnumber:
                                              widget.tenantcard.text,
                                          tenant_phone: widget.tenanphone.text,
                                          tenant_adress:
                                              widget.tenantadress.text,
                                          tenant_job: widget.tenantjob.text,
                                          tenant_nationality:
                                              widget.tenantnationality.text,
                                          owner_name: widget.ownername.text,
                                          owner_cardnumber:
                                              widget.ownercard.text,
                                          owner_phone: widget.ownerphone.text,
                                          owner_adress: widget.owneradress.text,
                                          owner_job: widget.ownerjob.text,
                                          owner_nationality:
                                              widget.ownernationality.text,
                                          aqar_adress: widget.aqaradress.text,
                                          governrate: widget.aqarmohafza.text,
                                          aqar_type: request[
                                              BlocProvider.of<contractCubit>(
                                                      context)
                                                  .aqartype!],
                                          area: widget.area.text,
                                          aqaradressdetails:
                                              widget.aqaradressdetails.text,
                                          emaranumber: widget.emaranumber.text,
                                          flatnumber: widget.housenumber.text,
                                          date: BlocProvider.of<DateCubit>(
                                                  context)
                                              .date1,
                                          contractfrom:
                                              BlocProvider.of<DateCubit>(
                                                      context)
                                                  .date3,
                                          contractto:
                                              BlocProvider.of<DateCubit>(
                                                      context)
                                                  .date4,
                                          contractvalue: widget.totalvalue.text,
                                          commission_type: commessionrequest[
                                              BlocProvider.of<contractCubit>(
                                                      context)
                                                  .commessiontype],
                                          commission:
                                              BlocProvider.of<contractCubit>(
                                                              context)
                                                          .commessiontype ==
                                                      "نسبه"
                                                  ? (double.parse(widget
                                                              .commessionvalue
                                                              .text) /
                                                          100 *
                                                          double.parse(widget
                                                              .totalvalue.text))
                                                      .toString()
                                                  : widget.commessionvalue.text,
                                          insurance_total:
                                              widget.insuranceval.text,
                                        ));
                              },
                            );
                          }),
                      ]))))
        ]));
  }

  @override
  void dispose() {
    widget.tenantname.clear();
    widget.tenanphone.clear();
    widget.tenantcard.clear();
    widget.tenantadress.clear();
    widget.tenantjob.clear();
    widget.tenantnationality.clear();
    widget.ownername.clear();
    widget.ownerphone.clear();
    widget.ownercard.clear();
    widget.owneradress.clear();
    widget.ownerjob.clear();
    widget.ownernationality.clear();
    widget.aqaradress.clear();
    widget.aqaradressdetails.clear();
    widget.aqarmohafza.clear();
    widget.area.clear();
    widget.emaranumber.clear();
    widget.housenumber.clear();
    widget.totalvalue.clear();
    widget.insuranceval.clear();
    widget.commessionvalue.clear();
    super.dispose();
  }
}
