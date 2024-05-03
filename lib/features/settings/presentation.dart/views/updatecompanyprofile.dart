import 'package:flutter/services.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/cashedimage.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/home/presentation/views/home.dart';
import 'package:ghhg/features/settings/data/models/updateprofilemodelrequest.dart';
import 'package:ghhg/features/settings/presentation.dart/viewmodel/updateprofilecuibt/updateprofilecuibt.dart';
import 'package:ghhg/features/settings/presentation.dart/viewmodel/updateprofilecuibt/updateprofilestates.dart';
import 'package:dio/dio.dart';
import 'package:ghhg/core/commn/sound.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class updatecompanyprofile extends StatefulWidget {
  final double width;

  updatecompanyprofile({super.key, required this.width});

  @override
  State<updatecompanyprofile> createState() => _updatecompanyprofileState();
}

class _updatecompanyprofileState extends State<updatecompanyprofile> {
  static final GlobalKey<FormState> opass = GlobalKey<FormState>();
  static final GlobalKey<FormState> npass = GlobalKey<FormState>();
  TextEditingController name =
      TextEditingController(text: cashhelper.getdata(key: "name"));

  final TextEditingController company_name =
      TextEditingController(text: cashhelper.getdata(key: "company_name"));

  final TextEditingController company_adress =
      TextEditingController(text: cashhelper.getdata(key: "company_adress"));

  final TextEditingController phone =
      TextEditingController(text: cashhelper.getdata(key: "phone"));

  final TextEditingController company_phone =
      TextEditingController(text: cashhelper.getdata(key: "company_phone"));

  final TextEditingController currency =
      TextEditingController(text: cashhelper.getdata(key: "currency"));

  TextEditingController oldpass = TextEditingController();

  TextEditingController newpass = TextEditingController();

  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: BackButton(
              color: Colors.white,
            ),
            title: const Text(
              'تعديل الملف الشخصي',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xff415769),
          ),
          body: Center(
            child: Container(
              width: widget.width,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    BlocBuilder<updateprofileCubit, updateprofilestates>(
                        builder: (context, state) {
                      return Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          BlocProvider.of<updateprofileCubit>(context).image ==
                                  null
                              ? CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.blue,
                                  child: CircleAvatar(
                                    radius: 69,
                                    child: imagefromrequest(
                                        border: 100,
                                        url: cashhelper.getdata(key: "logo"),
                                        height: 200,
                                        width: 200),
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.blue,
                                  child: CircleAvatar(
                                    radius: 69,
                                    backgroundImage: FileImage(
                                        BlocProvider.of<updateprofileCubit>(
                                                context)
                                            .image!),
                                  ),
                                ),
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<updateprofileCubit>(context)
                                    .uploadimage();
                              },
                              icon: Icon(Icons.camera_alt_outlined))
                        ],
                      );
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    custommytextform(controller: name, hintText: "الاسم"),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp("[0-9-.]")),
                        ],
                        controller: phone,
                        hintText: "الهاتف"),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                        controller: company_name, hintText: "اسم الشركه"),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp("[0-9-.]")),
                        ],
                        controller: company_phone,
                        hintText: "هاتف الشركه"),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                        controller: company_adress, hintText: "عنوان الشركه"),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(controller: currency, hintText: "العمله"),
                    const SizedBox(
                      height: 20,
                    ),
                    custommytextform(
                      controller: oldpass,
                      hintText: "كلمة المرور القديمه",
                      val: "يجب ادخال كلمة المرور القديمه",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    custommytextform(
                      controller: newpass,
                      hintText: "كلمة المرور الجديده",
                      val: "يجب ادخال كلمة المرور الجديده",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocConsumer<updateprofileCubit, updateprofilestates>(
                        listener: (context, state) {
                      // TODO: implement listener
                    }, builder: (context, state) {
                      return BlocConsumer<updateprofileCubit,
                          updateprofilestates>(listener: (context, state) {
                        if (state is updateprofilefailure) {
                          showsnack(
                              comment: state.error_message, context: context);
                        }
                        if (state is updateprofilesuccess) {
                          sound.playsound();
                          BlocProvider.of<updateprofileCubit>(context).image =
                              null;
                          generaltoken = state.updateprofilemodel.data!.token!;
                          cashhelper.setdata(
                              key: "logo",
                              value: state.updateprofilemodel.data!.logo!);
                          cashhelper.setdata(
                              key: "token",
                              value: state.updateprofilemodel.data!.token!);

                          cashhelper.setdata(
                              key: "name",
                              value: state.updateprofilemodel.data!.name!);
                          cashhelper.setdata(
                              key: "currency",
                              value: state.updateprofilemodel.data!.currency!);
                          cashhelper.setdata(
                              key: "company_phone",
                              value:
                                  state.updateprofilemodel.data!.companyPhone!);
                          cashhelper.setdata(
                              key: "phone",
                              value: state.updateprofilemodel.data!.phone!);
                          cashhelper.setdata(
                              key: "company_adress",
                              value: state
                                  .updateprofilemodel.data!.companyAddress!);
                          cashhelper.setdata(
                              key: "company_name",
                              value:
                                  state.updateprofilemodel.data!.companyName!);
                          navigateandfinish(
                              navigationscreen: MyHomePage(), context: context);
                          showsnack(
                              comment: "تم تعديل البيانات بنجاح",
                              context: context);
                        }
                      }, builder: (context, state) {
                        if (state is updateprofileloading) return loading();
                        return custommaterialbutton(
                          button_name: "تعديل البيانات",
                          buttonicon: Icons.edit,
                          onPressed: () async {
                            dynamic image;
                            if (BlocProvider.of<updateprofileCubit>(context)
                                    .image !=
                                null) {
                              image = await MultipartFile.fromFile(
                                  BlocProvider.of<updateprofileCubit>(context)
                                      .image!
                                      .path,
                                  filename: BlocProvider.of<updateprofileCubit>(
                                          context)
                                      .image!
                                      .path
                                      .split("/")
                                      .last);
                            }
                            if (oldpass.text.isNotEmpty &&
                                newpass.text.isEmpty) {
                              showdialogerror(
                                  error: "برجاء ادخال كلمة المرور الجديده",
                                  context: context);
                            } else if (oldpass.text.isEmpty &&
                                newpass.text.isNotEmpty) {
                              showdialogerror(
                                  error: "برجاء ادخال كلمة المرور القديمه",
                                  context: context);
                            } else {
                              BlocProvider.of<updateprofileCubit>(context)
                                  .updateprofle(
                                      token: generaltoken,
                                      updateprofilemodel:
                                          updateprofilemodelrequest(
                                        oldpass: oldpass.text,
                                        newpass: newpass.text,
                                        name: name.text,
                                        phone: phone.text,
                                        companyPhone: company_phone.text,
                                        company_adress: company_adress.text,
                                        company_name: company_name.text,
                                        currency: currency.text,
                                        logo: image,
                                      ));
                            }
                          },
                        );
                      });
                    })
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
