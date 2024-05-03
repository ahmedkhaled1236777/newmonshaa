import 'package:flutter/services.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/showdialogerror.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/cashedimage.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/core/commn/widgets/custommytextform.dart';
import 'package:ghhg/core/commn/widgets/custommaterialbutton.dart';
import 'package:ghhg/features/emoloyees/data/models/addemployeerequest.dart';
import 'package:ghhg/features/emoloyees/presentation/viewmodel/addemployee/addemployee_cubit.dart';
import 'package:ghhg/features/emoloyees/presentation/viewmodel/showemployeecuibt/employeecuibt.dart';
import 'package:ghhg/features/emoloyees/presentation/views/widgets/employees_powers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/employeemodel/datum.dart';

class editemployeedialog extends StatefulWidget {
  final double width;

  final double height;

  final Datum data;

  final int index;
  final TextEditingController employeename;
  final TextEditingController jobtittle;
  final TextEditingController adress;
  final TextEditingController cardnumber;
  final TextEditingController phone;
  final TextEditingController password;

  const editemployeedialog(
      {super.key,
      required this.width,
      required this.height,
      required this.data,
      required this.index,
      required this.employeename,
      required this.jobtittle,
      required this.adress,
      required this.cardnumber,
      required this.phone,
      required this.password});
  @override
  State<editemployeedialog> createState() => _editemployeedialogState(
      employeename: employeename,
      jobtittle: jobtittle,
      adress: adress,
      cardnumber: cardnumber,
      phone: phone,
      password: password);
}

class _editemployeedialogState extends State<editemployeedialog> {
  static final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController employeename;
  final TextEditingController jobtittle;
  final TextEditingController adress;
  final TextEditingController cardnumber;
  final TextEditingController phone;
  final TextEditingController password;

  _editemployeedialogState(
      {required this.employeename,
      required this.jobtittle,
      required this.adress,
      required this.cardnumber,
      required this.phone,
      required this.password});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddemployeeCubit, AddemployeeState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: SingleChildScrollView(
              child: Column(children: [
                Text('تعديل بيانات الموظف',
                    style: Appstyles.textStyle12
                        .copyWith(color: Appcolors.bluecolor),
                    textAlign: TextAlign.right),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                BlocBuilder<AddemployeeCubit, AddemployeeState>(
                    builder: (context, state) {
                  return Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      BlocProvider.of<AddemployeeCubit>(context).image == null
                          ? CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.blue,
                              child: CircleAvatar(
                                radius: 69,
                                child: imagefromrequest(
                                    border: 100,
                                    url: widget.data.employeeImage == null
                                        ? widget.data.logo!
                                        : widget.data.employeeImage!,
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
                                    BlocProvider.of<AddemployeeCubit>(context)
                                        .image!),
                              ),
                            ),
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<AddemployeeCubit>(context)
                                .uploadimage();
                          },
                          icon: Icon(Icons.camera_alt_outlined))
                    ],
                  );
                }),
                custommytextform(
                    controller: employeename, hintText: "اسم الموظف"),
                const SizedBox(
                  height: 10,
                ),
                custommytextform(
                    controller: jobtittle, hintText: "المسمي الوظيفي"),
                const SizedBox(
                  height: 10,
                ),
                custommytextform(controller: adress, hintText: "العنوان"),
                const SizedBox(
                  height: 10,
                ),
                custommytextform(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9-.]")),
                    ],
                    keyboardType: TextInputType.number,
                    controller: cardnumber,
                    hintText: "رقم البطاقه"),
                const SizedBox(
                  height: 10,
                ),
                custommytextform(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9-.]")),
                    ],
                    keyboardType: TextInputType.number,
                    controller: phone,
                    hintText: "رقم الهاتف"),
                const SizedBox(
                  height: 10,
                ),
                custommytextform(controller: password, hintText: "كلمة السر"),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                  child: const EmployessPowers(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                  child: Row(
                    children: [
                      Radio(
                          value: "1",
                          groupValue: BlocProvider.of<AddemployeeCubit>(context)
                              .is_active,
                          onChanged: (val) {
                            BlocProvider.of<AddemployeeCubit>(context)
                                .changestatus(val!);
                          }),
                      Text("مفعل"),
                      Spacer(),
                      Radio(
                          value: "0",
                          groupValue: BlocProvider.of<AddemployeeCubit>(context)
                              .is_active,
                          onChanged: (val) {
                            BlocProvider.of<AddemployeeCubit>(context)
                                .changestatus(val!);
                          }),
                      Text("غير مفعل"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocConsumer<AddemployeeCubit, AddemployeeState>(
                  listener: (context, state) async {
                    if (state is updateemployeefailure) {
                      showdialogerror(
                          error: state.errormessage, context: context);
                    }
                    if (state is updateemployeesuccess) {
                      BlocProvider.of<AddemployeeCubit>(context).image = null;
                      BlocProvider.of<showemployeescuibt>(context)
                          .employeesdata
                          .clear();
                      await BlocProvider.of<showemployeescuibt>(context)
                          .getallemployees(token: generaltoken, page: 1);
                      BlocProvider.of<AddemployeeCubit>(context).resetdata();
                      Navigator.pop(context);
                      showsnack(
                          comment: state.succes_message, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is updateemployeeloading) return loading();
                    return custommaterialbutton(
                      button_name: "تعديل البيانات",
                      buttonicon: Icons.edit,
                      onPressed: () async {
                        dynamic? image;
                        if (BlocProvider.of<AddemployeeCubit>(context).image !=
                            null) {
                          image = await MultipartFile.fromFile(
                              BlocProvider.of<AddemployeeCubit>(context)
                                  .image!
                                  .path,
                              filename:
                                  BlocProvider.of<AddemployeeCubit>(context)
                                      .image!
                                      .path
                                      .split("/")
                                      .last);
                        }
                        BlocProvider.of<AddemployeeCubit>(context)
                            .updateemployee(
                                token: generaltoken,
                                id: widget.data.id!.toInt(),
                                employee: addemployeemodel(
                                    employee_image: image,
                                    is_active:
                                        BlocProvider.of<AddemployeeCubit>(
                                                context)
                                            .is_active!,
                                    password: password.text,
                                    name: employeename.text,
                                    jobtittle: jobtittle.text,
                                    phone: phone.text,
                                    employee_address: adress.text,
                                    card_number: cardnumber.text,
                                    permessions:
                                        BlocProvider.of<AddemployeeCubit>(
                                                context)
                                            .getselecteditems()));
                      },
                    );
                  },
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
