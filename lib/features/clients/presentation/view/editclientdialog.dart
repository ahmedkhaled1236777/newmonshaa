import 'package:flutter/services.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/clients/data/model/clientmodelrequest.dart';
import 'package:ghhg/features/clients/presentation/viewmodel/clients/clients_cubit.dart';
import 'package:ghhg/features/clients/presentation/viewmodel/clients/clients_state.dart';
import 'package:ghhg/core/commn/widgets/customshoosedate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/clientmodel/datum.dart';

class editclientdialog extends StatefulWidget {
  final double width;
  final double height;
  final Datum data;
  final TextEditingController clientname;
  final TextEditingController clientphone;
  final TextEditingController code;
  final TextEditingController notes;

  editclientdialog({
    super.key,
    required this.width,
    required this.height,
    required this.data,
    required this.clientname,
    required this.clientphone,
    required this.code,
    required this.notes,
  });

  @override
  State<editclientdialog> createState() => _editclientdialogState(
      clientname: clientname,
      clientphone: clientphone,
      code: code,
      notes: notes);
}

class _editclientdialogState extends State<editclientdialog> {
  final TextEditingController clientname;
  final TextEditingController clientphone;
  final TextEditingController code;
  final TextEditingController notes;

  _editclientdialogState(
      {required this.clientname,
      required this.clientphone,
      required this.code,
      required this.notes});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<clientsCubit, clientsState>(
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
                  'images/employees.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Text('تعديل العملاء',
                    style: Appstyles.textStyle12
                        .copyWith(color: Appcolors.bluecolor),
                    textAlign: TextAlign.right),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Column(
                  children: [
                    custommytextform(
                        controller: clientname, hintText: "اسم العميل"),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                       inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp("[0-9-.]")),
  ], 
                                                          keyboardType: TextInputType.number,

                        controller: clientphone, hintText: "رقم هاتف العميل"),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                       inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp("[0-9-.]")),
  ], 
                                                          keyboardType: TextInputType.number,

                      controller: code, hintText: "الكود"),
                    const SizedBox(
                      height: 10,
                    ),
                    dropdownbutton(
                        onchanged: (val) {
                          BlocProvider.of<clientsCubit>(context)
                              .changestatus(val);
                        },
                        items: [
                          "انتظار",
                          "معاينه",
                          "معاينه مقبوله",
                          "معاينه مرفوضه",
                        ],
                        name: BlocProvider.of<clientsCubit>(context).status,
                        hint: "الحاله"),
                    const SizedBox(
                      height: 10,
                    ),
                    dropdownbutton(
                        onchanged: (val) {
                          BlocProvider.of<clientsCubit>(context)
                              .changedepartement(val);
                        },
                        items: [
                          "عقار بيع",
                          "عقار ايجار",
                          "ارض بيع",
                        ],
                        name:
                            BlocProvider.of<clientsCubit>(context).departement,
                        hint: "القسم"),
                    const SizedBox(
                      height: Appsizes.size10,
                    ),
                    BlocBuilder<DateCubit, DateState>(
                      builder: (context, state) {
                        return choosedatecontract(
                          date: BlocProvider.of<DateCubit>(context).date5,
                          onPressed: () {
                            BlocProvider.of<DateCubit>(context)
                                .changedate5(context);
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<DateCubit, DateState>(
                      builder: (context, state) {
                        return choosedatecontract(
                          date: BlocProvider.of<DateCubit>(context).time,
                          onPressed: () {
                            BlocProvider.of<DateCubit>(context)
                                .changetime(context);
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                      maxlines: 3,
                      controller: notes,
                      hintText: "ملاحظات",
                    ),
                  ],
                ),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                BlocConsumer<clientsCubit, clientsState>(
                  listener: (context, state) {
                    if (state is editclientsfailure) {
                    showdialogerror(error: state.error_message, context: context);

                    }
                    if (state is editclientssuccess) {
                      BlocProvider.of<DateCubit>(context).cleardates();
                      BlocProvider.of<clientsCubit>(context).departement = null;
                      BlocProvider.of<clientsCubit>(context).status = null;
                      
                            
                                   
                                      Navigator.pop(context);
                                        BlocProvider.of<clientsCubit>(context)
        .getallclientss(token: generaltoken, page: 1);

                      showsnack(
                          comment: state.success_message, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is editclientsloading) return loading();
                    return custommaterialbutton(
                        onPressed: () async {
                          BlocProvider.of<clientsCubit>(context).updateclients(
                              token: generaltoken,
                              id: widget.data.id!.toInt(),
                              clientsmodel: clientmodelrequest(
                                  name: clientname.text,
                                  phone: clientphone.text,
                                  code: code.text.isEmpty ? "0" : code.text,
                                  departement: clientsdepartementrequest[
                                      BlocProvider.of<clientsCubit>(context)
                                          .departement],
                                  status: clientstatussrequest[
                                      BlocProvider.of<clientsCubit>(context)
                                          .status],
                                  inspectiondate:
                                      BlocProvider.of<DateCubit>(context).date5 ==
                                              "تاريخ المعاينه"
                                          ? ""
                                          : BlocProvider.of<DateCubit>(context)
                                              .date5,
                                  inspectiontimedate:
                                      BlocProvider.of<DateCubit>(context).date5 ==
                                              "وقت المعاينه"
                                          ? ""
                                          : BlocProvider.of<DateCubit>(context)
                                              .time,
                                  notes: notes.text));
                        },
                        button_name: "تعديل العميل",
                        buttonicon: Icons.edit);
                  },
                ),
                SizedBox(
                  height: 40,
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
