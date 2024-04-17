import 'package:ghhg/core/commn/dialogerror.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:ghhg/features/contracts/presentation/views/addcontractwithscafold.dart';
import 'package:ghhg/features/contracts/presentation/views/contract.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/loading.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/core/styles/style.dart';
import 'package:ghhg/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:ghhg/features/tenants/presentation/view/widgets/customtabletenantitem.dart';
import 'package:ghhg/features/tenants/presentation/view/widgets/editdialog.dart';
import 'package:ghhg/features/tenants/presentation/view/widgets/showtenantdialog.dart';
import 'package:ghhg/features/tenants/presentation/viewmodel/tenants/tenant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtabletenants extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtabletenants(this.width);

  @override
  State<customtabletenants> createState() => _customtabletenantsState();
}

class _customtabletenantsState extends State<customtabletenants> {
  initscroll() async {
    await BlocProvider.of<TenantCubit>(context)
        .getalltenants(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<TenantCubit>(context)
            .getallmoretenants(token: generaltoken);
      }
    });
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
                children: BlocProvider.of<TenantCubit>(context)
                    .headertabel
                    .map((e) => customheadertable(
                          title: e,
                          flex:
                              e == "تعديل" || e == "حذف" || e == "عقد" ? 2 : 3,
                          textStyle:
                              Appstyles.getheadertextstyle(context: context),
                        ))
                    .toList()),
          ),
          Expanded(
              child: BlocConsumer<TenantCubit, TenantState>(
                  listener: (context, state) {
            if (state is showTenantfailure) {
              showsnack(comment: state.errorr_message, context: context);
            }
            if (state is deleteTenantfailure)
              showsnack(comment: state.errormessage, context: context);
          }, builder: (context, state) {
            if (state is showTenantloadin) return loading();
            if (state is showTenantfailure) return SizedBox();
            return SingleChildScrollView(
                controller: widget.scrollController,
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return index >=
                              BlocProvider.of<TenantCubit>(context)
                                  .tenantdata
                                  .length
                          ? loading()
                          : showtenantdialog(
                              index: index,
                              child: customtabletenantitem(
                                  textStyle: Appstyles.gettabletextstyle(
                                      context: context),
                                  tenantname:
                                      BlocProvider.of<TenantCubit>(context)
                                          .tenantdata[index]
                                          .name!,
                                  adress: BlocProvider.of<TenantCubit>(context)
                                      .tenantdata[index]
                                      .cardAddress!,
                                  phone: BlocProvider.of<TenantCubit>(context)
                                      .tenantdata[index]
                                      .phone!,
                                  addcontrect: IconButton(
                                      onPressed: () {
                                        if (MediaQuery.sizeOf(context).width <=
                                            950) {
                                          BlocProvider.of<contractCubit>(
                                                      context)
                                                  .id =
                                              BlocProvider.of<TenantCubit>(
                                                      context)
                                                  .tenantdata[index]
                                                  .id!
                                                  .toInt();
                                          navigateandfinish(
                                              navigationscreen:
                                                  addcontractwithscafold(
                                                      tenantname: TextEditingController(
                                                          text: BlocProvider.of<TenantCubit>(context)
                                                              .tenantdata[index]
                                                              .name!),
                                                      tenanphone:
                                                          TextEditingController(
                                                        text: BlocProvider.of<
                                                                    TenantCubit>(
                                                                context)
                                                            .tenantdata[index]
                                                            .phone!,
                                                      ),
                                                      tenantcard: TextEditingController(
                                                          text: BlocProvider.of<TenantCubit>(context)
                                                              .tenantdata[index]
                                                              .cardNumber),
                                                      tenantadress: TextEditingController(
                                                          text: BlocProvider.of<TenantCubit>(context)
                                                              .tenantdata[index]
                                                              .cardAddress!),
                                                      tenantjob: TextEditingController(
                                                          text: BlocProvider.of<TenantCubit>(context)
                                                              .tenantdata[index]
                                                              .jobTitle),
                                                      tenantnationality: TextEditingController(
                                                          text: BlocProvider.of<TenantCubit>(context)
                                                              .tenantdata[index]
                                                              .nationality),
                                                      ownername:
                                                          TextEditingController(),
                                                      ownerphone:
                                                          TextEditingController(),
                                                      ownercard:
                                                          TextEditingController(),
                                                      owneradress:
                                                          TextEditingController(),
                                                      ownerjob:
                                                          TextEditingController(),
                                                      ownernationality:
                                                          TextEditingController(),
                                                      aqaradress:
                                                          TextEditingController(),
                                                      aqaradressdetails: TextEditingController(),
                                                      aqarmohafza: TextEditingController(),
                                                      aqartype: TextEditingController(),
                                                      area: TextEditingController(),
                                                      emaranumber: TextEditingController(),
                                                      housenumber: TextEditingController(),
                                                      totalvalue: TextEditingController(),
                                                      insuranceval: TextEditingController(),
                                                      commessionvalue: TextEditingController(),
                                                      periodofdelay: TextEditingController()),
                                              context: context);
                                        } else {
                                          BlocProvider.of<contractCubit>(
                                                      context)
                                                  .id =
                                              BlocProvider.of<TenantCubit>(
                                                      context)
                                                  .tenantdata[index]
                                                  .id!
                                                  .toInt();
                                          navigateandfinish(
                                              navigationscreen: Contract(
                                                  tenantname: TextEditingController(
                                                      text: BlocProvider.of<TenantCubit>(context)
                                                          .tenantdata[index]
                                                          .name!),
                                                  tenanphone:
                                                      TextEditingController(
                                                    text: BlocProvider.of<
                                                                TenantCubit>(
                                                            context)
                                                        .tenantdata[index]
                                                        .phone!,
                                                  ),
                                                  tenantcard: TextEditingController(
                                                      text: BlocProvider.of<TenantCubit>(context)
                                                          .tenantdata[index]
                                                          .cardNumber),
                                                  tenantadress: TextEditingController(
                                                      text: BlocProvider.of<TenantCubit>(context)
                                                          .tenantdata[index]
                                                          .cardAddress!),
                                                  tenantjob: TextEditingController(
                                                      text: BlocProvider.of<TenantCubit>(context)
                                                          .tenantdata[index]
                                                          .jobTitle),
                                                  tenantnationality: TextEditingController(
                                                      text: BlocProvider.of<TenantCubit>(context)
                                                          .tenantdata[index]
                                                          .nationality),
                                                  ownername:
                                                      TextEditingController(),
                                                  ownerphone:
                                                      TextEditingController(),
                                                  ownercard:
                                                      TextEditingController(),
                                                  owneradress:
                                                      TextEditingController(),
                                                  ownerjob:
                                                      TextEditingController(),
                                                  ownernationality:
                                                      TextEditingController(),
                                                  aqaradress: TextEditingController(),
                                                  aqaradressdetails: TextEditingController(),
                                                  aqarmohafza: TextEditingController(),
                                                  aqartype: TextEditingController(),
                                                  area: TextEditingController(),
                                                  emaranumber: TextEditingController(),
                                                  housenumber: TextEditingController(),
                                                  totalvalue: TextEditingController(),
                                                  insuranceval: TextEditingController(),
                                                  commessionvalue: TextEditingController(),
                                                  periodofdelay: TextEditingController()),
                                              context: context);
                                        }
                                      },
                                      icon: const Icon(Icons.add_box_outlined,
                                          size: 23, color: Color(0xff00416A))),
                                  delet: IconButton(
                                      onPressed: () async {
                                        awsomdialogerror(
                                          mywidget: BlocConsumer<TenantCubit,
                                              TenantState>(
                                            listener: (context, state) {
                                              if (state
                                                  is deleteTenantsuccess) {
                                                Navigator.pop(context);

                                                showsnack(
                                                    comment:
                                                        state.succes_message,
                                                    context: context);
                                              }
                                              if (state
                                                  is deleteTenantfailure) {
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
                                                    await BlocProvider.of<
                                                                TenantCubit>(
                                                            context)
                                                        .deletetenant(
                                                            token: generaltoken,
                                                            tenantid: BlocProvider
                                                                    .of<TenantCubit>(
                                                                        context)
                                                                .tenantdata[
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
                                          tittle: "هل تريد حذف المستأجر ؟",
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
                                      showDialog(
                                          barrierDismissible:
                                              false, // user must tap button!

                                          context: context,
                                          builder: (_) {
                                            return AlertDialog(
                                                title: Container(
                                                  alignment: Alignment.topLeft,
                                                  child: IconButton(
                                                      onPressed: () {
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
                                                scrollable: false,
                                                content: edittenantdialog(
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
                                                          TenantCubit>(context)
                                                      .tenantdata[index],
                                                  job: TextEditingController(
                                                      text: BlocProvider.of<
                                                                  TenantCubit>(
                                                              context)
                                                          .tenantdata[index]
                                                          .jobTitle),
                                                  adress: TextEditingController(
                                                      text: BlocProvider.of<
                                                                  TenantCubit>(
                                                              context)
                                                          .tenantdata[index]
                                                          .cardAddress),
                                                  name: TextEditingController(
                                                      text: BlocProvider.of<
                                                                  TenantCubit>(
                                                              context)
                                                          .tenantdata[index]
                                                          .name),
                                                  cardnumber:
                                                      TextEditingController(
                                                          text: BlocProvider.of<
                                                                      TenantCubit>(
                                                                  context)
                                                              .tenantdata[index]
                                                              .cardNumber),
                                                  nationality:
                                                      TextEditingController(
                                                          text: BlocProvider.of<
                                                                      TenantCubit>(
                                                                  context)
                                                              .tenantdata[index]
                                                              .nationality),
                                                  phone: TextEditingController(
                                                      text: BlocProvider.of<
                                                                  TenantCubit>(
                                                              context)
                                                          .tenantdata[index]
                                                          .phone
                                                          .toString()),
                                                ));
                                          });
                                    },
                                  )),
                            );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount:
                        BlocProvider.of<TenantCubit>(context).loading == true
                            ? BlocProvider.of<TenantCubit>(context)
                                    .tenantdata
                                    .length +
                                1
                            : BlocProvider.of<TenantCubit>(context)
                                .tenantdata
                                .length));
          }))
        ]));
  }
}
