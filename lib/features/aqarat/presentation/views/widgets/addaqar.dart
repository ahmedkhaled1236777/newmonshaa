import 'package:flutter/services.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/constants.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/sound.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarstate.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:ghhg/features/aqarat/presentation/views/estate.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/customgridimages.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/core/commn/widgets/customchoosedate.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/pickedimage.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addaqar extends StatefulWidget {
  final double width;

  const addaqar({super.key, required this.width});

  @override
  State<addaqar> createState() => _addaqarState();
}

class _addaqarState extends State<addaqar> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  TextEditingController aqarnumber = TextEditingController();
  TextEditingController housenumber = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController advertiser_name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController roomsnumber = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController toilletsnumber = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController adressdetails = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController compoundname = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    BlocProvider.of<DateCubit>(context).cleardates();
    BlocProvider.of<addaqarcuibt>(context).cleardata();
  }

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
                    child: BlocBuilder<addaqarcuibt, addaqarstate>(
                        builder: (context, state) {
                      return Column(
                        children: [
                          Image.asset(
                            'images/appartments.png',
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(
                            height: Appsizes.size15,
                          ),
                          Text('تسجيل العقارات',
                              style: Appstyles.textStyle12
                                  .copyWith(color: Appcolors.bluecolor),
                              textAlign: TextAlign.right),
                          const SizedBox(
                            height: Appsizes.size15,
                          ),
                          custommytextform(
                              controller: compoundname,
                              hintText:  "اسم الكمبوند (في حالة وجود العقار داخل الكمبوند)"),
                          SizedBox(
                            height: 10,
                          ),
                          Form(
                            key: formkey,
                            child: Column(
                              children: [
                                custommytextform(
                                    val: "برجاء ادخال عنوان العقار",
                                    controller: adress,
                                    hintText: "عنوان العقار (المدينه)"),
                                const SizedBox(
                                  height: 10,
                                ),
                                custommytextform(
                                    val: "برجاء ادخال عنوان العقار بالتفصيل",
                                    controller: adressdetails,
                                    hintText:
                                        "عنوان العقار بالتفصيل (الحي او الشارع)"),
                                const SizedBox(
                                  height: 10,
                                ),
                                dropdownbutton(
                                  items: [
                                    "فيلا فارغه",
                                    "شقه فارغه",
                                    "شقه مفروشه",
                                    "فيلا مفروشه",
                                    "مكتب ادارى فارغ",
                                    "مكتب ادارى مفروش",
                                    "محل",
                                  ],
                                  hint: "نوع العقار",
                                  name: BlocProvider.of<addaqarcuibt>(context)
                                      .aqartype,
                                  onchanged: (val) {
                                    BlocProvider.of<addaqarcuibt>(context)
                                        .changeaddaqartype(val);
                                  },
                                ),
                                const SizedBox(
                                  height: Appsizes.size10,
                                ),
                                dropdownbutton(
                                    onchanged: (val) {
                                      BlocProvider.of<addaqarcuibt>(context)
                                          .changeaddaqardepartement(val);
                                    },
                                    items: ["بيع", "ايجار"],
                                    name: BlocProvider.of<addaqarcuibt>(context)
                                        .departement,
                                    hint: "القسم"),
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
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9-.]")),
                                    ],
                                    keyboardType: TextInputType.number,
                                    controller: aqarnumber,
                                    hintText: "رقم العماره او الفيلا"),
                                const SizedBox(
                                  height: Appsizes.size10,
                                ),
                                if (BlocProvider.of<addaqarcuibt>(context)
                                        .aqartype !=
                                    "محل")
                                  custommytextform(
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[0-9-.]")),
                                      ],
                                      keyboardType: TextInputType.number,
                                      controller: housenumber,
                                      hintText: "رقم الشقه"),
                                if (BlocProvider.of<addaqarcuibt>(context)
                                        .aqartype !=
                                    "محل")
                                  const SizedBox(
                                    height: 10,
                                  ),
                                if (BlocProvider.of<addaqarcuibt>(context)
                                        .aqartype !=
                                    "محل")
                                  custommytextform(
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[0-9-.]")),
                                      ],
                                      keyboardType: TextInputType.number,
                                      controller: roomsnumber,
                                      hintText: "عدد الغرف"),
                                if (BlocProvider.of<addaqarcuibt>(context)
                                        .aqartype !=
                                    "محل")
                                  const SizedBox(
                                    height: Appsizes.size10,
                                  ),
                                if (BlocProvider.of<addaqarcuibt>(context)
                                        .aqartype !=
                                    "محل")
                                  custommytextform(
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[0-9-.]")),
                                      ],
                                      keyboardType: TextInputType.number,
                                      controller: toilletsnumber,
                                      hintText: "عدد الحمامات"),
                                if (BlocProvider.of<addaqarcuibt>(context)
                                        .aqartype !=
                                    "محل")
                                  const SizedBox(
                                    height: Appsizes.size10,
                                  ),
                                dropdownbutton(
                                    onchanged: (val) {
                                      BlocProvider.of<addaqarcuibt>(context)
                                          .changeaddaqaradvistortype(val);
                                    },
                                    name: BlocProvider.of<addaqarcuibt>(context)
                                        .advistor_type,
                                    items: ["صاحب عقار", "شركة عقارات"],
                                    hint: "نوع المعلن"),
                                const SizedBox(
                                  height: 10,
                                ),
                                custommytextform(
                                    val: "برجاء ادخال اسم المالك او الوسيط",
                                    controller: advertiser_name,
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
                            controller: details,
                            hintText: "تفاصيل العقار",
                            maxlines: 3,
                          ),
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
                          customgridimages(),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          BlocConsumer<addaqarcuibt, addaqarstate>(
                              listener: (context, state) async {
                            if (state is addaaqarfailure)
                              showsnack(comment: state.error, context: context);
                            if (state is addaaqarsuccess) {
                              sound.playsound();
                              showsnack(
                                  comment: "تمت اضافة العقار بنجاح",
                                  context: context);

                              BlocProvider.of<addaqarcuibt>(context)
                                  .cleardata();
                              BlocProvider.of<DateCubit>(context).date1 =
                                  "التاريخ";
                              MediaQuery.sizeOf(context).width > 950
                                  ? navigateandfinish(
                                      navigationscreen: Estate(),
                                      context: context)
                                  : {
                                      await BlocProvider.of<ShowaqaratCubit>(
                                              context)
                                          .getallaqarat(
                                              token: generaltoken, page: 1),
                                      Navigator.pop(context),
                                    };
                            }
                          }, builder: (context, state) {
                            if (state is addaaqarloading) return loading();
                            return custommaterialbutton(
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    if (BlocProvider.of<addaqarcuibt>(context)
                                            .aqartype ==
                                        null) {
                                      showdialogerror(
                                          error: "برجاء اختيار نوع العقار",
                                          context: context);
                                    } else if (BlocProvider.of<addaqarcuibt>(
                                                context)
                                            .departement ==
                                        null) {
                                      showdialogerror(
                                          context: context,
                                          error: "برجاء اختيار القسم");
                                    } else if (BlocProvider.of<addaqarcuibt>(
                                                context)
                                            .advistor_type ==
                                        null) {
                                      showdialogerror(
                                          context: context,
                                          error: "برجاء اختيار نوع المعلن");
                                    } else if (BlocProvider.of<DateCubit>(
                                                context)
                                            .date1 ==
                                        "التاريخ") {
                                      showdialogerror(
                                          context: context,
                                          error: "برجاء اختيار التاريخ");
                                    } else {
                                      if (BlocProvider.of<addaqarcuibt>(context)
                                          .imageFile
                                          .isNotEmpty) {
                                        await BlocProvider.of<addaqarcuibt>(
                                                context)
                                            .uploadimages();
                                      }

                                      await BlocProvider.of<addaqarcuibt>(context).addaqar(
                                          myaddaqarrequest: addaqarrequest(
                                              coumpound_name: compoundname.text.isEmpty
                                                  ? ""
                                                  : compoundname.text,
                                              advertiser_name:
                                                  advertiser_name.text,
                                              real_state_images:
                                                  BlocProvider.of<addaqarcuibt>(context)
                                                      .images,
                                              real_state_address: adress.text,
                                              real_state_address_details:
                                                  adressdetails.text,
                                              real_state_type: request[
                                                  BlocProvider.of<addaqarcuibt>(context)
                                                      .aqartype!],
                                              department: request[
                                                  BlocProvider.of<addaqarcuibt>(context)
                                                      .departement],
                                              advertiser_type:
                                                  request[BlocProvider.of<addaqarcuibt>(context).advistor_type],
                                              advertised_phone_number: phone.text,
                                              real_state_space: area.text,
                                              real_state_price: price.text,
                                              number_of_bathrooms: toilletsnumber.text.isEmpty ? "0" : toilletsnumber.text,
                                              number_of_rooms: roomsnumber.text.isEmpty ? "0" : roomsnumber.text,
                                              advertise_details: details.text,
                                              state_date_register: BlocProvider.of<DateCubit>(context).date1,
                                              apartment_number: housenumber.text.isEmpty ? "0" : housenumber.text,
                                              building_number: aqarnumber.text),
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
    aqarnumber.dispose();
    housenumber.dispose();
    adress.dispose();
    advertiser_name.dispose();
    phone.dispose();
    roomsnumber.dispose();
    price.dispose();
    toilletsnumber.dispose();
    details.dispose();
    adressdetails.dispose();
    area.dispose();
    super.dispose();
  }
}
