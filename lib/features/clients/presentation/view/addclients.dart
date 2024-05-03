import 'package:flutter/services.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/sound.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/clients/data/model/clientmodelrequest.dart';
import 'package:ghhg/features/clients/presentation/view/clients.dart';
import 'package:ghhg/features/clients/presentation/viewmodel/clients/clients_cubit.dart';
import 'package:ghhg/features/clients/presentation/viewmodel/clients/clients_state.dart';
import 'package:ghhg/core/commn/widgets/customshoosedate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addclients extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final double width;

  addclients({super.key, required this.formkey, required this.width});

  @override
  State<addclients> createState() => _addclientsState();
}

class _addclientsState extends State<addclients> {
  TextEditingController clientname = TextEditingController();
  TextEditingController clientphone = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController notes = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<clientsCubit>(context).cleardata();
    BlocProvider.of<DateCubit>(context).cleardates();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<clientsCubit, clientsState>(
      builder: (context, state) {
        return Form(
          key: widget.formkey,
          child: Container(
            height: double.infinity,
            width: widget.width,
            color: Colors.white,
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
            child: ListView(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/employees.png',
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text('تسجيل العملاء',
                          style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff2ba4c8),
                              fontWeight: FontWeight.w100),
                          textAlign: TextAlign.right),
                      const SizedBox(
                        height: 15,
                      ),
                      custommytextform(
                        controller: clientname,
                        hintText: "اسم العميل",
                        val: "برجاء ادخال اسم العميل",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp("[0-9-.]")),
                        ],
                        keyboardType: TextInputType.number,
                        controller: clientphone,
                        hintText: "رقم هاتف العميل",
                        val: "برجاء ادخال رقم هاتف العميل",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       dropdownbutton(
                          onchanged: (val) {
                            BlocProvider.of<clientsCubit>(context)
                                .changeclienttype(val);
                          },
                          items: [
                            
                            "عميل مباشر",
                            "شركة عقارات",
                          ],
                          name: BlocProvider.of<clientsCubit>(context).clienttype,
                          hint: "نوع العميل"),
                          SizedBox(height: 10,),
                      custommytextform(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp("[0-9-.]")),
                        ],
                        keyboardType: TextInputType.number,
                        controller: code,
                        hintText: "الكود",
                      ),
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
                          name: BlocProvider.of<clientsCubit>(context)
                              .departement,
                          hint: "القسم"),
                      const SizedBox(
                        height: Appsizes.size10,
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
                      custommytextform(
                        maxlines: 3,
                        controller: notes,
                        hintText: "ملاحظات",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      BlocConsumer<clientsCubit, clientsState>(
                        listener: (context, state) async {
                          if (state is Addclientsfailure)
                            showsnack(
                                comment: state.error_message, context: context);
                          if (state is Addclientssuccess) {
                            sound.playsound();
                            MediaQuery.sizeOf(context).width > 950
                                ? navigateandfinish(
                                    navigationscreen: clients(),
                                    context: context)
                                : {
                                    await BlocProvider.of<clientsCubit>(context)
                                        .getallclientss(
                                            token: generaltoken, page: 1),
                                    Navigator.pop(context),
                                  };

                            showsnack(
                                comment: state.success_message,
                                context: context);
                          }
                        },
                        builder: (context, state) {
                          if (state is Addclientsloading) return loading();
                          return custommaterialbutton(
                              onPressed: () async {
                                if (widget.formkey.currentState!.validate()) {
                                   if (BlocProvider.of<clientsCubit>(context)
                                          .clienttype ==
                                      null) {
                                    showdialogerror(
                                        error: "برجاء اختيار نوع العميل",
                                        context: context);
                                  }
                                 else if (BlocProvider.of<clientsCubit>(context)
                                          .departement ==
                                      null) {
                                    showdialogerror(
                                        error: "برجاء اختيار القسم",
                                        context: context);
                                  } else if (BlocProvider.of<clientsCubit>(
                                              context)
                                          .status ==
                                      null) {
                                    showdialogerror(
                                        error: "برجاء اختيار الحاله",
                                        context: context);
                                  }

                                  // ignore: curly_braces_in_flow_control_structures
                                  else
                                    await BlocProvider.of<clientsCubit>(context).addclients(
                                        token: generaltoken,
                                        clients: clientmodelrequest(
                                          client_type: clientstyperequest[
                                                BlocProvider.of<clientsCubit>(context)
                                                    .clienttype] ,
                                            name: clientname.text,
                                            phone: clientphone.text,
                                            code: code.text.isEmpty
                                                ? "0"
                                                : code.text,
                                            departement: clientsdepartementrequest[
                                                BlocProvider.of<clientsCubit>(context)
                                                    .departement],
                                            status: clientstatussrequest[
                                                BlocProvider.of<clientsCubit>(context)
                                                    .status],
                                            inspectiondate: BlocProvider.of<DateCubit>(context).date5 ==
                                                    "تاريخ المعاينه"
                                                ? ""
                                                : BlocProvider.of<DateCubit>(context)
                                                    .date5,
                                            inspectiontimedate:
                                                BlocProvider.of<DateCubit>(context).time ==
                                                        "وقت المعاينه"
                                                    ? ""
                                                    : BlocProvider.of<DateCubit>(context).time,
                                            notes: notes.text));
                                }
                              },
                              button_name: "تسجيل البيانات",
                              buttonicon: Icons.send);
                        },
                      )
                    ],
                  )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    clientname.dispose();
    clientphone.dispose();
    code.dispose();
    notes.dispose();
    super.dispose();
  }
}
