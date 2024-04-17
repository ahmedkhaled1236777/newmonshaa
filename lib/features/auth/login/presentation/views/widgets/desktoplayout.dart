import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/sound.dart';
import 'package:ghhg/core/textes/textes.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/auth/login/data/models/loginrequest.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/customimage.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/customtextform.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/noaccount.dart';
import 'package:ghhg/features/auth/login/presentation/viewsmodel/logincuibt/logincuibt.dart';
import 'package:ghhg/features/auth/login/presentation/viewsmodel/logincuibt/loginstates.dart';
import 'package:ghhg/features/auth/register/presentation/views/register.dart';
import 'package:ghhg/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:ghhg/features/home/presentation/views/home.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class Desktoplayout extends StatefulWidget {
  @override
  State<Desktoplayout> createState() => _DesktoplayoutState();
}

class _DesktoplayoutState extends State<Desktoplayout> {
  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();

  bool obscureText = true;

  IconData passicon = Icons.visibility_off;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.15),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            customimage(
              width: width * 0.4,
              height: height * 0.5,
              imagename: "images/qqq.jpg",
            ),
            Container(
              width: width * 0.3,
              height: height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: height * 0.15),
              child: Form(
                  key: formkey,
                  child: ListView(
                    children: [
                      customimage(
                          width: width * 0.1,
                          height: height * 0.2,
                          imagename: 'images/building.png'),
                      const Text(Apptextes.login, style: Appstyles.textstle13),
                      const SizedBox(
                        height: Appsizes.size20,
                      ),
                      customtextform(
                          val: "برجاء ادخال رقم الهاتف",
                          controller: phone,
                          prefixicon: Icons.phone,
                          hintText: Apptextes.phone),
                      const SizedBox(
                        height: Appsizes.size20,
                      ),
                      customtextform(
                        val: "برجاء ادخال كلمة المرور",
                        controller: password,
                        prefixicon: Icons.password,
                        hintText: Apptextes.pass,
                        obscureText: obscureText,
                        suffixIcon: IconButton(
                            onPressed: () {
                              obscureText = !obscureText;
                              passicon == Icons.visibility
                                  ? passicon = Icons.visibility_off
                                  : passicon = Icons.visibility;
                              setState(() {});
                            },
                            icon: Icon(passicon,
                                size: Appsizes.size20,
                                color: Appcolors.blackcolor)),
                      ),
                      const SizedBox(
                        height: Appsizes.size20,
                      ),
                      BlocConsumer<logincuibt, loginstate>(
                        builder: (context, state) {
                          if (state is loginloading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Appcolors.bluecolor,
                              ),
                            );
                          }

                          return custommaterialbutton(
                            button_name: Apptextes.login,
                            buttonicon: Icons.login,
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                await BlocProvider.of<logincuibt>(context)
                                    .loginpostdata(
                                        login: loginrequest(
                                  token: "",
                                  device_type: "android",
                                  phone: phone.text,
                                  password: password.text,
                                ));
                              }
                            },
                          );
                        },
                        listener: (BuildContext context, loginstate state) {
                          if (state is loginfailure) {
                            showsnack(
                                comment: state.error_message, context: context);
                          } else if (state is loginsucces) {
                            sound.playsound();
                            password.clear();
                            phone.clear();
                            generaltoken = state.loginmodel.data!.token!;
                            cashhelper.setdata(
                                key: "logo",
                                value: state.loginmodel.data!.logo);
                            cashhelper.setdata(
                                key: "permessions",
                                value: state.loginmodel.data!.permissions);
                            cashhelper.setdata(
                                key: "token",
                                value: state.loginmodel.data!.token);

                            cashhelper.setdata(
                                key: "name",
                                value: state.loginmodel.data!.name);
                            cashhelper.setdata(
                                key: "currency",
                                value: state.loginmodel.data!.currency);
                            cashhelper.setdata(
                                key: "company_phone",
                                value: state.loginmodel.data!.companyPhone);
                            cashhelper.setdata(
                                key: "role",
                                value: state.loginmodel.data!.userType);
                            cashhelper.setdata(
                                key: "phone",
                                value: state.loginmodel.data!.phone);
                            cashhelper.setdata(
                                key: "company_adress",
                                value: state.loginmodel.data!.companyAddress);
                            cashhelper.setdata(
                                key: "company_name",
                                value: state.loginmodel.data!.companyName);
                            showsnack(
                                comment: "تم تسجيل الدخول بنجاح",
                                context: context);
                            navigateandfinish(
                                navigationscreen: MyHomePage(),
                                context: context);
                          }
                        },
                      ),
                      const SizedBox(
                        height: Appsizes.size10,
                      ),
                      noaccount(
                          maintext: Apptextes.noaccount,
                          buttontext: Apptextes.registernow,
                          navigated_widget: Register())
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    phone.dispose();

    password.dispose();
    super.dispose();
  }
}
