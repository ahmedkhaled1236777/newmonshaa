import 'package:flutter/services.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/sharedpref/cashhelper.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:ghhg/features/aqarat/data/models/showstate/datum.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/edit/edit_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:ghhg/core/commn/widgets/customchoosedate.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/customgridimages.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/pickedimage.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class editdialog extends StatefulWidget {
  final double width;
  final double height;
  final Datum data;
  final TextEditingController aqarnumber;
  final TextEditingController advertiser_name;
  final TextEditingController housenumber;
  final TextEditingController adress;
  final TextEditingController phone;
  final TextEditingController roomsnumber;
  final TextEditingController price;
  final TextEditingController toilletsnumber;
  final TextEditingController details;
  final TextEditingController adressdetails;
  final TextEditingController area;
  final TextEditingController compoundname;

  editdialog(
      {super.key,
      required this.compoundname,
      required this.width,
      required this.advertiser_name,
      required this.height,
      required this.aqarnumber,
      required this.data,
      required this.housenumber,
      required this.adress,
      required this.phone,
      required this.roomsnumber,
      required this.price,
      required this.toilletsnumber,
      required this.details,
      required this.adressdetails,
      required this.area});

  @override
  State<editdialog> createState() => _editdialogState(
        compoundname: compoundname,
        adress: adress,
        adressdetails: adressdetails,
        advertiser_name: advertiser_name,
        aqarnumber: aqarnumber,
        toilletsnumber: toilletsnumber,
        details: details,
        area: area,
        housenumber: housenumber,
        phone: phone,
        roomsnumber: roomsnumber,
        price: price,
      );
}

class _editdialogState extends State<editdialog> {
  final TextEditingController aqarnumber;
  final TextEditingController advertiser_name;
  final TextEditingController housenumber;
  final TextEditingController adress;
  final TextEditingController phone;
  final TextEditingController roomsnumber;
  final TextEditingController price;
  final TextEditingController toilletsnumber;
  final TextEditingController details;
  final TextEditingController adressdetails;
  final TextEditingController compoundname;
  final TextEditingController area;
  static final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  _editdialogState(
      {required this.aqarnumber,
      required this.advertiser_name,
      required this.compoundname,
      required this.housenumber,
      required this.adress,
      required this.phone,
      required this.roomsnumber,
      required this.price,
      required this.toilletsnumber,
      required this.details,
      required this.adressdetails,
      required this.area});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCubit, EditState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: Appsizes.size20,
                ),
                Image.asset(
                  'images/appartments.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Text('تعديل عقار',
                    style: Appstyles.textStyle12
                        .copyWith(color: Appcolors.bluecolor),
                    textAlign: TextAlign.right),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                custommytextform(
                    controller: compoundname, hintText: "اسم الكمبوند"),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      custommytextform(
                          readonly: cashhelper.getdata(key: "role") != "manager"
                              ? true
                              : false,
                          val: "برجاء ادخال اسم المالك او الوسيط",
                          controller: advertiser_name,
                          hintText: "اسم المالك او الوسيط"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          readonly: cashhelper.getdata(key: "role") != "manager"
                              ? true
                              : false,
                          val: "برجاء ادخال عنوان العقار",
                          controller: adress,
                          hintText: "عنوان العقار"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          readonly: cashhelper.getdata(key: "role") != "manager"
                              ? true
                              : false,
                          val: "برجاء ادخال عنوان العقار بالتفصيل",
                          controller: adressdetails,
                          hintText: "عنوان العقار بالتفصيل"),
                      const SizedBox(
                        height: 10,
                      ),
                      if (BlocProvider.of<addaqarcuibt>(context).aqartype !=
                          "محل")
                        custommytextform(
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9-.]")),
                            ],
                            keyboardType: TextInputType.number,
                            val: "برجاء ادخال عدد الغرف",
                            controller: roomsnumber,
                            hintText: "عدد الغرف"),
                      if (BlocProvider.of<addaqarcuibt>(context).aqartype !=
                          "محل")
                        const SizedBox(
                          height: Appsizes.size10,
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
                          val: "برجاء ادخال السعر",
                          controller: price,
                          hintText: "السعر"),
                      const SizedBox(
                        height: Appsizes.size10,
                      ),
                      custommytextform(
                          readonly: cashhelper.getdata(key: "role") != "manager"
                              ? true
                              : false,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp("[0-9-.]")),
                          ],
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
                custommytextform(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9-.]")),
                    ],
                    keyboardType: TextInputType.number,
                    controller: aqarnumber,
                    hintText: "رقم العماره"),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                if (BlocProvider.of<addaqarcuibt>(context).aqartype != "محل")
                  custommytextform(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp("[0-9-.]")),
                      ],
                      keyboardType: TextInputType.number,
                      controller: housenumber,
                      hintText: "رقم الشقه"),
                if (BlocProvider.of<addaqarcuibt>(context).aqartype != "محل")
                  const SizedBox(
                    height: 10,
                  ),
                dropdownbutton(
                  items: [
                    "فيلا فارغه",
                    "شقه فارغه",
                    "شقه مفروشه",
                    "فيلا مفروشه",
                    "مكتب اداري فارغ",
                    "مكتب اداري مفروش",
                    "محل"
                  ],
                  hint: "نوع العقار",
                  name: BlocProvider.of<EditCubit>(context).aqartype == null
                      ? show[widget.data.realStateType]
                      : BlocProvider.of<EditCubit>(context).aqartype,
                  onchanged: (val) {
                    BlocProvider.of<EditCubit>(context).changeaddaqartype(val);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                dropdownbutton(
                    onchanged: (val) {
                      BlocProvider.of<EditCubit>(context)
                          .changeaddaqardepartement(val);
                    },
                    items: ["بيع", "ايجار"],
                    name:
                        BlocProvider.of<EditCubit>(context).departement == null
                            ? show[widget.data.department]
                            : BlocProvider.of<EditCubit>(context).departement,
                    hint: "القسم"),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                dropdownbutton(
                    onchanged: (val) {
                      BlocProvider.of<EditCubit>(context)
                          .changeaddaqaradvistortype(val);
                    },
                    name: BlocProvider.of<EditCubit>(context).advistor_type ==
                            null
                        ? show[widget.data.advertiserType]
                        : BlocProvider.of<EditCubit>(context).advistor_type,
                    items: ["صاحب عقار", "شركة عقارات"],
                    hint: "نوع المعلن"),
                const SizedBox(
                  height: 10,
                ),
                if (BlocProvider.of<EditCubit>(context).aqartype != "محل")
                  custommytextform(
                      keyboardType: TextInputType.number,
                      controller: toilletsnumber,
                      hintText: "عدد الحمامات"),
                if (BlocProvider.of<EditCubit>(context).aqartype != "محل")
                  const SizedBox(
                    height: Appsizes.size10,
                  ),
                custommytextform(
                    maxlines: 3,
                    controller: details,
                    hintText: "تفاصيل العقار"),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                choosedate(),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                pickedimage(),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                customgridimages(),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                BlocConsumer<EditCubit, EditState>(
                  listener: (context, state) {
                    if (state is editfailure) {
                      showdialogerror(
                          error: state.error_message, context: context);
                    }
                    if (state is editsuccess) {
                      BlocProvider.of<DateCubit>(context).cleardates();
                      BlocProvider.of<addaqarcuibt>(context).cleardata();

                      Navigator.pop(context);
                      BlocProvider.of<ShowaqaratCubit>(context)
                          .getallaqarat(token: generaltoken, page: 1);

                      showsnack(
                          comment: state.successmessage, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is editloading) return loading();
                    return custommaterialbutton(
                        onPressed: () async {
                          if (BlocProvider.of<addaqarcuibt>(context)
                              .imageFile
                              .isNotEmpty) {
                            await BlocProvider.of<addaqarcuibt>(context)
                                .uploadimages();
                          }
                          BlocProvider.of<EditCubit>(context).updateaqar(
                              token: generaltoken,
                              id: widget.data.id!.toInt(),
                              add_aqar: addaqarrequest(
                                  coumpound_name: compoundname.text,
                                  advertiser_name: advertiser_name.text,
                                  real_state_address: adress.text,
                                  real_state_images:
                                      BlocProvider.of<addaqarcuibt>(context)
                                          .images,
                                  real_state_address_details:
                                      adressdetails.text,
                                  real_state_type:
                                      BlocProvider.of<EditCubit>(context).aqartype == null
                                          ? widget.data.realStateType
                                          : request[
                                              BlocProvider.of<EditCubit>(context)
                                                  .aqartype!],
                                  department: BlocProvider.of<EditCubit>(context).departement == null
                                      ? widget.data.department
                                      : request[BlocProvider.of<EditCubit>(context)
                                          .departement!],
                                  advertiser_type:
                                      BlocProvider.of<EditCubit>(context).advistor_type == null
                                          ? widget.data.advertiserType
                                          : request[BlocProvider.of<EditCubit>(context).advistor_type!],
                                  advertised_phone_number: phone.text,
                                  real_state_space: area.text,
                                  real_state_price: price.text,
                                  number_of_rooms: roomsnumber.text,
                                  state_date_register: BlocProvider.of<DateCubit>(context).date1,
                                  advertise_details: details.text,
                                  apartment_number: housenumber.text,
                                  number_of_bathrooms: toilletsnumber.text,
                                  building_number: aqarnumber.text));
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
