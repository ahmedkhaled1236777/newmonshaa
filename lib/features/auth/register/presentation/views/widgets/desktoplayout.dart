import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/textes/textes.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/auth/login/presentation/views/login.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/customimage.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/customtextform.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/noaccount.dart';
import 'package:ghhg/features/auth/register/data/models/registermodelrequest.dart';
import 'package:ghhg/features/auth/register/presentation/viewsmodel/registercuibt/registercuibt.dart';
import 'package:ghhg/features/auth/register/presentation/viewsmodel/registercuibt/registerstates.dart';
import 'package:ghhg/features/auth/register/presentation/views/register.dart';
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
  TextEditingController name = TextEditingController();

  TextEditingController shop_address = TextEditingController();
  TextEditingController shop_name = TextEditingController();

  TextEditingController companyphone = TextEditingController();

  bool obscureText = true;

  IconData passicon = Icons.visibility_off;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.12),
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
              padding: EdgeInsets.only(top: height * 0.04),
              child: ListView(
                children: [
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        customimage(
                            width: width * 0.1,
                            height: height * 0.1,
                            imagename: 'images/building.png'),
                        const SizedBox(
                          width: double.infinity,
                          child: Text(Apptextes.register,
                              textAlign: TextAlign.right,
                              style: Appstyles.textstle13),
                        ),
                        const SizedBox(
                          height: Appsizes.size20,
                        ),
                        customtextform(
                          controller: name,
                          prefixicon: Icons.person,
                          hintText: "الاسم الشخصي",
                          val: "برجاء ادخال الاسم الشخصي",
                        ),
                        const SizedBox(
                          height: Appsizes.size20,
                        ),
                        customtextform(
                          controller: shop_name,
                          prefixicon: Icons.home,
                          hintText: "اسم الموسسه",
                          val: "برجاء ادخال اسم المؤسسه",
                        ),
                        const SizedBox(
                          height: Appsizes.size20,
                        ),
                        customtextform(
                          controller: shop_address,
                          prefixicon: Icons.location_pin,
                          hintText: "عنوان المؤسسه",
                          val: "برجاء ادخال عنوان المؤسسه ",
                        ),
                        const SizedBox(
                          height: Appsizes.size20,
                        ),
                        customtextform(
                          controller: phone,
                          prefixicon: Icons.phone,
                          hintText: "رقم الهاتف",
                          val: "برجاء ادخال رقم الهاتف",
                        ),
                        const SizedBox(
                          height: Appsizes.size20,
                        ),
                        customtextform(
                          controller: companyphone,
                          prefixicon: Icons.phone,
                          hintText: "رقم هاتف الشركه",
                          val: "برجاء ادخال رقم هاتف الشركه",
                        ),
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Appsizes.size20,
                  ),
                  BlocConsumer<registercuibt, registerstate>(
                    listener: (context, state) {
                      if (state is registerfailure) {
                        showsnack(
                            comment: state.error_message, context: context);
                      } else if (state is registersuccess) {
                        name.clear();
                        phone.clear();
                        companyphone.clear();
                        shop_address.clear();
                        shop_name.clear();
                        password.clear();
                        navigateandfinish(
                            navigationscreen: Login(), context: context);
                        showsnack(
                            comment: state.registermodel.message!,
                            context: context);
                      }
                    },
                    builder: (context, state) {
                      if (state is registerloading) return loading();
                      return custommaterialbutton(
                        button_name: Apptextes.register,
                        buttonicon: Icons.login,
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            await BlocProvider.of<registercuibt>(context)
                                .register(
                                    registerrequest: registerrequest(
                              name: name.text,
                              company_name: shop_name.text,
                              company_address: shop_address.text,
                              password: password.text,
                              phone: phone.text,
                              company_phone: companyphone.text,
                              privacy_and_policy: "1",
                            ));
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: Appsizes.size10,
                  ),
                  noaccount(
                      maintext: Apptextes.haveaccount,
                      buttontext: Apptextes.login,
                      navigated_widget: Login())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
