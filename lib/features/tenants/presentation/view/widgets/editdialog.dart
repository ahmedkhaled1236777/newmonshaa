import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/tenants/data/model/tenantmodel/datum.dart';
import 'package:ghhg/features/tenants/data/model/tenantmodelrequest.dart';
import 'package:ghhg/features/tenants/presentation/viewmodel/tenants/tenant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class edittenantdialog extends StatefulWidget {
  final double width;
  final double height;
  final Datum data;
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController adress;
  final TextEditingController cardnumber;
  final TextEditingController job;
  final TextEditingController nationality;

  edittenantdialog(
      {super.key,
      required this.width,
      required this.height,
      required this.data,
      required this.name,
      required this.phone,
      required this.adress,
      required this.cardnumber,
      required this.job,
      required this.nationality});

  @override
  State<edittenantdialog> createState() => _edittenantdialogState(
      name: name,
      phone: phone,
      data: data,
      adress: adress,
      cardnumber: cardnumber,
      job: job,
      nationality: nationality);
}

class _edittenantdialogState extends State<edittenantdialog> {
  final Datum data;
  static final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController adress;
  final TextEditingController cardnumber;
  final TextEditingController job;
  final TextEditingController nationality;

  _edittenantdialogState(
      {required this.data,
      required this.name,
      required this.phone,
      required this.adress,
      required this.cardnumber,
      required this.job,
      required this.nationality});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TenantCubit, TenantState>(
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
                  'images/person.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Text('تعديل المستأجرين',
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
                          val: "برجاء ادخال اسم المستاجر",
                          controller: name,
                          hintText: "اسم المستاجر"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                                                            keyboardType: TextInputType.number,

                          val: "برجاء ادخال رقم الهاتف",
                          controller: phone,
                          hintText: "رقم الهاتف"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                                                            keyboardType: TextInputType.number,

                          val: "برجاء ادخال رقم البطاقه",
                          controller: cardnumber,
                          hintText: "رقم البطاقه"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          val: "برجاء ادخال العنوان الموجود في البطاقه",
                          controller: adress,
                          hintText: "العنوان الموجود في البطاقه"),
                      const SizedBox(
                        height: Appsizes.size10,
                      ),
                      custommytextform(
                          val: "برجاء ادخال الوظيفه",
                          controller: job,
                          hintText: "الوظيفه"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          val: "برجاء ادخال الجنسيه",
                          controller: nationality,
                          hintText: "الجنسيه"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                BlocConsumer<TenantCubit, TenantState>(
                  listener: (context, state) async {
                    if (state is editTenantfailure) {
showdialogerror(error: state.error_message, context: context);
                    }
                    if (state is editTenantsuccess) {
                       await BlocProvider.of<TenantCubit>(context)
        .getalltenants(token: generaltoken, page: 1);
Navigator.pop(context);

                      showsnack(
                          comment: state.success_message, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is editTenantloading) return loading();
                    return custommaterialbutton(
                        onPressed: () async {
                          BlocProvider.of<TenantCubit>(context).updatetenant(
                              token: generaltoken,
                              id: widget.data.id!.toInt(),
                              tenantmodel: tenentmodelrequest(
                                  name: name.text,
                                  cardnumber: cardnumber.text,
                                  phone: phone.text,
                                  adress: adress.text,
                                  job: job.text,
                                  nationality: nationality.text));
                        },
                        button_name: "تعديل المستاجرين",
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
