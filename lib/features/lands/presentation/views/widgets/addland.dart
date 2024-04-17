import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/dialogerror.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/core/commn/sound.dart';

import 'package:ghhg/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/lands/data/models/addlandrequestmodel.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/addlandcuibt/addlandcuibt.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/addlandcuibt/addlandstate.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/lands/presentation/views/estateland.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/customchoosedate.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/customgridimages.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/pickedimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addland extends StatefulWidget {
  final double width;

  const addland({super.key, required this.width});

  @override
  State<addland> createState() => _addlandState();
}

class _addlandState extends State<addland> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  TextEditingController clientname = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController adressdetails = TextEditingController();
  TextEditingController area = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      color: Colors.white,
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
      child: ListView(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.27,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: BlocBuilder<addlandcuibt, addlandstate>(
                        builder: (context, state) {
                      return Column(
                        children: [
                          Image.asset(
                            'images/land.png',
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(
                            height: Appsizes.size15,
                          ),
                          Text('تسجيل الاراضي',
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
                                    val: "برجاء ادخال عنوان الارض",
                                    controller: adress,
                                    hintText: "العنوان"),
                                const SizedBox(
                                  height: 10,
                                ),
                                custommytextform(
                                    val: "برجاء ادخال عنوان الارض بالتفصيل",
                                    controller: adressdetails,
                                    hintText: "عنوان الارض بالتفصيل"),
                                const SizedBox(
                                  height: 10,
                                ),
                                custommytextform(
                                    val: "يرجي ادخال اسم المالك او الوسيط",
                                    controller: clientname,
                                    hintText: "اسم المالك او الوسيط"),
                                const SizedBox(
                                  height: 10,
                                ),
                                custommytextform(
                                    keyboardType: TextInputType.number,
                                    val: "برجاء ادخال المساحه",
                                    controller: area,
                                    hintText: "المساحه"),
                                const SizedBox(
                                  height: 10,
                                ),
                                custommytextform(
                                    keyboardType: TextInputType.number,
                                    val: "برجاء ادخال سعر المتر",
                                    controller: price,
                                    hintText: "سعر المتر"),
                                const SizedBox(
                                  height: Appsizes.size10,
                                ),
                                custommytextform(
                                    keyboardType: TextInputType.number,
                                    val: "برجاء ادخال رقم الهاتف",
                                    controller: phone,
                                    hintText: "رقم هاتف المالك او الوسيط"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          dropdownbutton(
                              onchanged: (val) {
                                BlocProvider.of<addlandcuibt>(context)
                                    .changeaddaqaradvistortype(val);
                              },
                              name: BlocProvider.of<addlandcuibt>(context)
                                  .advistor_type,
                              items: ["صاحب الارض", "شركة عقارات"],
                              hint: "نوع المعلن"),
                          const SizedBox(
                            height: 10,
                          ),
                          custommytextform(
                            controller: details,
                            hintText: "تفاصيل الارض",
                            maxlines: 3,
                          ),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          choosedateland(),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          pickedimageland(),
                          const SizedBox(
                            height: Appsizes.size15,
                          ),
                          customgridimagesland(),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          BlocConsumer<addlandcuibt, addlandstate>(
                              listener: (context, state) {
                            if (state is addlandfailure)
                              showsnack(comment: state.error, context: context);
                            if (state is addlandsuccess) {
                              sound.playsound();
                              showsnack(
                                  comment: "تمت اضافة الارض بنجاح",
                                  context: context);

                              BlocProvider.of<addlandcuibt>(context)
                                  .cleardata();
                              BlocProvider.of<DatelandCubit>(context).date1 =
                                  "التاريخ";

                              navigateandfinish(
                                  navigationscreen: landsEstate(),
                                  context: context);
                            }
                          }, builder: (context, state) {
                            if (state is addlandloading) return loading();
                            return custommaterialbutton(
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    if (BlocProvider.of<addlandcuibt>(context)
                                            .advistor_type ==
                                        null) {
                                      dialogerror(context,
                                          error: "برجاء اختيار نوع المعلن");
                                    } else if (BlocProvider.of<DatelandCubit>(
                                                context)
                                            .date1 ==
                                        "التاريخ") {
                                      dialogerror(context,
                                          error: "برجاء اختيار التاريخ");
                                    } else {
                                      if (BlocProvider.of<addlandcuibt>(context)
                                          .imageFile
                                          .isNotEmpty) {
                                        await BlocProvider.of<addlandcuibt>(
                                                context)
                                            .uploadimages();
                                      }
                                      await BlocProvider.of<addlandcuibt>(
                                              context)
                                          .addland(
                                              myaddaqarrequest: addlandrequest(
                                                land_images: BlocProvider.of<
                                                        addlandcuibt>(context)
                                                    .images,
                                                advertise_details: details.text,
                                                real_state_address_details:
                                                    adressdetails.text,
                                                address: adress.text,
                                                seller_name: clientname.text,
                                                size_in_metres:
                                                    num.parse(area.text),
                                                price_of_one_meter:
                                                    num.parse(price.text),
                                                total_cost:
                                                    num.parse(area.text) *
                                                        num.parse(price.text),
                                                seller_phone_number: phone.text,
                                                advertiser_type: requestland[
                                                    BlocProvider.of<
                                                                addlandcuibt>(
                                                            context)
                                                        .advistor_type],
                                                land_date_register: BlocProvider
                                                        .of<DatelandCubit>(
                                                            context)
                                                    .date1,
                                              ),
                                              token: generaltoken);
                                    }
                                  }
                                },
                                button_name: "تسجيل البيانات",
                                buttonicon: Icons.send);
                          })
                        ],
                      );
                    })),
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    clientname.dispose();
    adress.dispose();
    phone.dispose();
    price.dispose();
    details.dispose();
    adressdetails.dispose();
    area.dispose();
    super.dispose();
  }
}
