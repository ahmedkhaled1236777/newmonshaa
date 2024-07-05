import 'package:flutter/services.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';

import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/lands/data/models/addlandrequestmodel.dart';
import 'package:ghhg/features/lands/data/models/showlands/datum.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/addlandcuibt/addlandcuibt.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/edit/edit_cubit.dart';
import 'package:ghhg/features/lands/presentation/viewmodel/showlands/showlands_cubit.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/customchoosedate.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/customgridimages.dart';
import 'package:ghhg/features/lands/presentation/views/widgets/pickedimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class editlanddialog extends StatefulWidget {
  final double width;

  final double height;

  final Datum data;
  final TextEditingController clientname;
  final TextEditingController adress;
  final TextEditingController adressdetails;
  final TextEditingController price;
  final TextEditingController phone;
  final TextEditingController details;
  final TextEditingController area;

  const editlanddialog(
      {super.key,
      required this.width,
      required this.height,
      required this.data,
      required this.clientname,
      required this.adress,
      required this.adressdetails,
      required this.price,
      required this.phone,
      required this.details,
      required this.area});
  @override
  State<editlanddialog> createState() => _editlanddialogState(
      clientname: clientname,
      adress: adress,
      adressdetails: adressdetails,
      phone: phone,
      price: price,
      details: details,
      area: area);
}

class _editlanddialogState extends State<editlanddialog> {
  static final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController clientname;
  final TextEditingController adress;
  final TextEditingController adressdetails;
  final TextEditingController price;
  final TextEditingController phone;
  final TextEditingController details;
  final TextEditingController area;

  _editlanddialogState(
      {required this.clientname,
      required this.adress,
      required this.adressdetails,
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
            width: widget.width,
            height: widget.height,
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
                          readonly: cashhelper.getdata(key: "role") != "manager"
                              ? true
                              : false,
                          val: "برجاء ادخال عنوان الارض",
                          controller: adress,
                          hintText: "العنوان"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          readonly: cashhelper.getdata(key: "role") != "manager"
                              ? true
                              : false,
                          val: "برجاء ادخال تفاصيل العنوان",
                          controller: adressdetails,
                          hintText: "عنوان الارض بالتفصيل"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          readonly: cashhelper.getdata(key: "role") != "manager"
                              ? true
                              : false,
                          val: "يرجي ادخال اسم المالك او الوسيط",
                          controller: clientname,
                          hintText: "اسم المالك او الوسيط"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp("[0-9-.]")),
                          ],
                          keyboardType: TextInputType.number,
                          val: "برجاء ادخال المساحه",
                          controller: area,
                          hintText: "المساحه"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp("[0-9-.]")),
                          ],
                          keyboardType: TextInputType.number,
                          val: "برجاء ادخال سعر المتر",
                          controller: price,
                          hintText: "سعر المتر"),
                      const SizedBox(
                        height: Appsizes.size10,
                      ),
                   if(! cashhelper.getdata(
                        key: "permessions").contains("owner_phone_hidden") )     custommytextform(
                          readonly: cashhelper.getdata(key: "role") != "manager"
                              ? true
                              : false,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp("[0-9-.]")),
                          ],
                          keyboardType: TextInputType.number,
                          val: "برجاء ادخال رقم هاتف المالك او الوسيط",
                          controller: phone,
                          hintText: "رقم هاتف المالك"),
                    ],
                  ),
                ),
              if(! cashhelper.getdata(
                        key: "permessions").contains("owner_phone_hidden") )    const SizedBox(
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
                        ? showland[widget.data.advertiserType]
                        : BlocProvider.of<EditlandCubit>(context).advistor_type,
                    items: ["صاحب الارض", "شركة عقارات"],
                    hint: "نوع المعلن"),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                custommytextform(
                    maxlines: 3, controller: details, hintText: "تفاصيل الارض"),
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
                  listener: (context, state) async {
                    if (state is editlandfailure) {
                      showdialogerror(
                          error: state.error_message, context: context);
                    }
                    if (state is editlandsuccess) {
                      await BlocProvider.of<ShowlandsCubit>(context)
                          .getallalands(token: generaltoken, page: 1);
                      Navigator.pop(context);
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
                              id: widget.data.id!.toInt(),
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
                                    ? widget.data.advertiserType
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
