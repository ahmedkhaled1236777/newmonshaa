import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/dialogerror.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/commn/widgets/nodata.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/core/commn/widgets/customheadertable.dart';
import 'package:ghhg/features/emoloyees/presentation/viewmodel/addemployee/addemployee_cubit.dart';
import 'package:ghhg/features/emoloyees/presentation/viewmodel/showemployeecuibt/employeecuibt.dart';
import 'package:ghhg/features/emoloyees/presentation/viewmodel/showemployeecuibt/employeestates.dart';
import 'package:ghhg/features/emoloyees/presentation/views/widgets/customtableemployeeitem.dart';
import 'package:ghhg/features/emoloyees/presentation/views/widgets/editemployeedialog.dart';
import 'package:ghhg/features/emoloyees/presentation/views/widgets/showemployeedialog.dart';
import 'package:ghhg/features/emoloyees/presentation/views/widgets/show_employees.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableemployees extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtableemployees(this.width);

  @override
  State<customtableemployees> createState() => _customtableemployeeesState();
}

class _customtableemployeeesState extends State<customtableemployees> {
  initscroll() async {
    BlocProvider.of<showemployeescuibt>(context).employeesdata.clear();
    await BlocProvider.of<showemployeescuibt>(context)
        .getallemployees(token: generaltoken, page: 1);
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: widget.width,
        height: MediaQuery.of(context).size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 50,
            color: Appcolors.buttoncolor,
            child: Row(
                children: BlocProvider.of<AddemployeeCubit>(context)
                    .headertable
                    .map((e) => customheadertable(
                        title: e,
                        flex: e == "تعديل" || e == "حذف" ? 2 : 3,
                        textStyle:
                            Appstyles.getheadertextstyle(context: context)))
                    .toList()),
          ),
          Expanded(
              child: BlocConsumer<showemployeescuibt, showemployeesstates>(
                  listener: (context, state) {
            if (state is showemployeesfailure)
              showsnack(comment: state.error_message, context: context);
            if (state is deleteemployeefailure)
              showsnack(comment: state.errormessage, context: context);
          }, builder: (context, state) {
            if (state is showemployeesloading) return loading();
            if (state is showemployeesfailure) return SizedBox();
            return BlocProvider.of<showemployeescuibt>(context)
                    .employeesdata
                    .isEmpty
                ? nodata()
                : SingleChildScrollView(
                    controller: widget.scrollController,
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              navigateandfinish(
                                  navigationscreen: ShowEmployees(),
                                  context: context);
                            },
                            child: showtemployeedialog(
                              index: index,
                              child: customtableemployeeitem(
                                  textStyle: Appstyles.gettabletextstyle(
                                      context: context),
                                  employeename:
                                      BlocProvider.of<showemployeescuibt>(
                                              context)
                                          .employeesdata[index]
                                          .name!,
                                  adress: BlocProvider.of<showemployeescuibt>(
                                          context)
                                      .employeesdata[index]
                                      .address!,
                                  phone: BlocProvider.of<showemployeescuibt>(
                                          context)
                                      .employeesdata[index]
                                      .phone!,
                                  job: BlocProvider.of<showemployeescuibt>(
                                          context)
                                      .employeesdata[index]
                                      .jobTitle!,
                                  delet: IconButton(
                                      onPressed: () async {
                                        awsomdialogerror(
                                          mywidget: BlocConsumer<
                                              showemployeescuibt,
                                              showemployeesstates>(
                                            listener: (context, state) {
                                              if (state
                                                  is deleteemployeesuccess) {
                                                Navigator.pop(context);

                                                showsnack(
                                                    comment:
                                                        state.succes_message,
                                                    context: context);
                                              }
                                              if (state
                                                  is deleteemployeefailure) {
                                                Navigator.pop(context);

                                                showsnack(
                                                    comment: state.errormessage,
                                                    context: context);
                                              }
                                            },
                                            builder: (context, state) {
                                              return ElevatedButton(
                                                  style: const ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Color.fromARGB(255,
                                                                37, 163, 42)),
                                                  ),
                                                  onPressed: () async {
                                                    await await BlocProvider.of<
                                                                showemployeescuibt>(
                                                            context)
                                                        .deleteemployee(
                                                            token: generaltoken,
                                                            employeenumber:
                                                                BlocProvider.of<
                                                                            showemployeescuibt>(
                                                                        context)
                                                                    .employeesdata[
                                                                        index]
                                                                    .id!
                                                                    .toInt());
                                                  },
                                                  child: const Text(
                                                    "تاكيد",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                    textAlign: TextAlign.center,
                                                  ));
                                            },
                                          ),
                                          context: context,
                                          tittle: "هل تريد حذف الموظف ؟",
                                        );
                                      },
                                      icon: const Icon(
                                        size: 24,
                                        Icons.delete_outline_outlined,
                                        color: Colors.red,
                                      )),
                                  edit: IconButton(
                                    icon: const Icon(
                                      Icons.edit_note,
                                      size: 29,
                                    ),
                                    onPressed: () {
                                      BlocProvider.of<AddemployeeCubit>(context)
                                              .is_active =
                                          BlocProvider.of<showemployeescuibt>(
                                                  context)
                                              .employeesdata[index]
                                              .isActive
                                              .toString();
                                      BlocProvider.of<AddemployeeCubit>(context)
                                          .showselecteditems(BlocProvider.of<
                                                  showemployeescuibt>(context)
                                              .employeesdata[index]
                                              .permissions!);
                                      showDialog(
                                          barrierDismissible: false,
                                          // user must tap button!
                                          context: context,
                                          builder: (_) {
                                            return AlertDialog(
                                                title: Container(
                                                  alignment: Alignment.topLeft,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        BlocProvider.of<
                                                                    AddemployeeCubit>(
                                                                context)
                                                            .resetdata();
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      icon: const Icon(
                                                          Icons.close)),
                                                ),
                                                surfaceTintColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0)),
                                                content: editemployeedialog(
                                                  index: index,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                                  .width >
                                                              950
                                                          ? MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.25
                                                          : MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              1,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.85,
                                                  data: BlocProvider.of<
                                                              showemployeescuibt>(
                                                          context)
                                                      .employeesdata[index],
                                                  employeename:
                                                      TextEditingController(
                                                          text: BlocProvider.of<
                                                                      showemployeescuibt>(
                                                                  context)
                                                              .employeesdata[
                                                                  index]
                                                              .name
                                                              .toString()),
                                                  adress: TextEditingController(
                                                      text: BlocProvider.of<
                                                                  showemployeescuibt>(
                                                              context)
                                                          .employeesdata[index]
                                                          .address
                                                          .toString()),
                                                  cardnumber: TextEditingController(
                                                      text: BlocProvider.of<
                                                                  showemployeescuibt>(
                                                              context)
                                                          .employeesdata[index]
                                                          .cardNumber
                                                          .toString()),
                                                  phone: TextEditingController(
                                                      text: BlocProvider.of<
                                                                  showemployeescuibt>(
                                                              context)
                                                          .employeesdata[index]
                                                          .phone
                                                          .toString()),
                                                  password: TextEditingController(
                                                      text: BlocProvider.of<
                                                                  showemployeescuibt>(
                                                              context)
                                                          .employeesdata[index]
                                                          .password
                                                          .toString()),
                                                  jobtittle: TextEditingController(
                                                      text: BlocProvider.of<
                                                                  showemployeescuibt>(
                                                              context)
                                                          .employeesdata[index]
                                                          .jobTitle
                                                          .toString()),
                                                ));
                                          });
                                    },
                                  )),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: BlocProvider.of<showemployeescuibt>(context)
                            .employeesdata
                            .length),
                  );
          }))
        ]));
  }
}
