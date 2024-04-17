import 'package:ghhg/features/connect/presentation/view/connect.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/connect/data/model/connectmodelrequest.dart';
import 'package:ghhg/features/connect/presentation/viewmodel/connect/connectcuibt.dart';
import 'package:ghhg/features/connect/presentation/viewmodel/connect/connectstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghhg/core/commn/sound.dart';

class desktopconnect extends StatefulWidget {
  @override
  State<desktopconnect> createState() => _desktopconnectState();
}

class _desktopconnectState extends State<desktopconnect> {
  TextEditingController message = TextEditingController();

  TextEditingController tittle = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(20),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Image.asset('images/building.png',
                        width: 50, height: 50, alignment: Alignment.topRight),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'أبدا مع تطبيق منشاءة وسجل جميع عقاراتك ',
                      style: TextStyle(
                          color: Color(0xff246b8d),
                          fontSize: 12.5,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: const Text(
                          'تطبيق منشاءة هو عبارة عن نظام ادارة العقارات السكنية على محرك بحث تفصيلي، يمكن العملاء ومديري الموقع من البحث على الوحدات العقارية من خلال فلاتر بحث متنوعة. كما يمكن التحكم بالموقع وإدارته من خلال لوحة التحكم الخاصة به',
                          style: TextStyle(
                              fontSize: 12.5,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w100,
                              height: 2),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(20),
                child: Form(
                    key: formkey,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                          child: const Text('رساله',
                              style: TextStyle(
                                  fontSize: 12.5,
                                  color: Color(0xff2ba4c8),
                                  fontWeight: FontWeight.w100),
                              textAlign: TextAlign.right),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        custommytextform(
                          controller: tittle,
                          hintText: "عنوان الرساله",
                          val: "لابد من ادخال عنوان الرساله",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        custommytextform(
                          controller: message,
                          hintText: "موضوع الرساله",
                          maxlines: 4,
                          val: "لابد من ادخال موضوع الرساله",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocConsumer<connectCubit, connectState>(
                            listener: (context, state) {
                          if (state is ConnectStatefailure)
                            showsnack(
                                comment: state.error_message, context: context);
                          if (state is ConnectStatesuccess) {
                            sound.playsound();
                            tittle.clear();
                            message.clear();
                            showsnack(
                                comment: state.success_message,
                                context: context);
                          }
                          ;
                        }, builder: (context, state) {
                          if (state is ConnectStateloading) return loading();
                          return custommaterialbutton(
                            button_name: "ارسال رساله",
                            buttonicon: Icons.send,
                            onPressed: (() async {
                              if (formkey.currentState!.validate()) {
                                await BlocProvider.of<connectCubit>(context)
                                    .addmessage(
                                        token: generaltoken,
                                        connect: connectmodelrequest(
                                            tittle: tittle.text,
                                            messgae: message.text));
                              }
                            }),
                          );
                        })
                      ],
                    )),
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    tittle.dispose();
    message.dispose();

    super.dispose();
  }
}
