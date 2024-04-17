import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';

import 'package:ghhg/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/lands/data/models/addlandrequestmodel.dart';
import 'package:ghhg/features/lands/data/models/showlands/datum.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/addlandcuibt/addlandcuibt.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/edit/edit_cubit.dart';
import 'package:ghhg/features/lands/presentation/views/estateland.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/customchoosedate.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/customgridimages.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/pickedimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class editlanddialog extends StatelessWidget {
  final double width;
  final double height;
  final Datum data;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController clientname;
  final TextEditingController adress;
  final TextEditingController adressdetails;
  final TextEditingController price;
  final TextEditingController phone;
  final TextEditingController details;
  final TextEditingController area;

  editlanddialog(
      {super.key,
      required this.width,
      required this.height,
      required this.adressdetails,
      required this.data,
      required this.clientname,
      required this.adress,
      required this.price,
      required this.phone,
      required this.details,
      required this.area});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditlandCubit, EditlandState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: width,
            height: height,
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: Appsizes.size20,
                ),
                Image.asset(
                  'images/land.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Text('تعديل الارض',
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
                          val: "برجاء ادخال تفاصيل العنوان",
                          controller: adressdetails,
                          hintText: "عنوان الارض بالتفصيل"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          val: "يرجي ادخال اسم العميل",
                          controller: clientname,
                          hintText: "اسم العميل"),
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
                          hintText: "رقم االهاتف"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                dropdownbutton(
                    onchanged: (val) {
                      BlocProvider.of<EditlandCubit>(context)
                          .changeaddlandadvistortype(val);
                    },
                    // ignore: prefer_if_null_operators
                    name: BlocProvider.of<EditlandCubit>(context)
                                .advistor_type ==
                            null
                        ? showland[data.advertiserType]
                        : BlocProvider.of<EditlandCubit>(context).advistor_type,
                    items: ["صاحب الارض", "شركة عقارات"],
                    hint: "نوع المعلن"),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                custommytextform(
                    maxlines: 3,
                    controller: details,
                    hintText: "تفاصيل الاعلان"),
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
                const SizedBox(
                  height: Appsizes.size15,
                ),
                customgridimagesland(),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                BlocConsumer<EditlandCubit, EditlandState>(
                  listener: (context, state) {
                    if (state is editlandfailure) {
                      showsnack(comment: state.error_message, context: context);
                    }
                    if (state is editlandsuccess) {
                      navigateandfinish(
                          navigationscreen: landsEstate(), context: context);

                      showsnack(
                          comment: state.successmessage, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is editlandloading) return loading();
                    return custommaterialbutton(
                        onPressed: () async {
                          if (BlocProvider.of<addlandcuibt>(context)
                              .imageFile
                              .isNotEmpty) {
                            await BlocProvider.of<addlandcuibt>(context)
                                .uploadimages();
                          }
                          BlocProvider.of<EditlandCubit>(context).updateland(
                              token: generaltoken,
                              id: data.id!.toInt(),
                              add_land: addlandrequest(
                                address: adress.text,
                                real_state_address_details: adressdetails.text,
                                land_images:
                                    BlocProvider.of<addlandcuibt>(context)
                                        .images,
                                total_cost: num.parse(area.text) *
                                    num.parse(price.text),
                                seller_name: clientname.text,
                                advertiser_type: BlocProvider.of<EditlandCubit>(
                                                context)
                                            .advistor_type ==
                                        null
                                    ? data.advertiserType
                                    : request[
                                        BlocProvider.of<EditlandCubit>(context)
                                            .advistor_type!],
                                seller_phone_number: phone.text,
                                size_in_metres: num.parse(area.text),
                                price_of_one_meter: num.parse(price.text),
                                land_date_register:
                                    BlocProvider.of<DatelandCubit>(context)
                                        .date1,
                                advertise_details: details.text,
                              ));
                        },
                        button_name: "تعديل البيانات",
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
