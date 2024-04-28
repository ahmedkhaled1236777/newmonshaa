import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/toast.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:ghhg/features/contracts/presentation/views/addcontract.dart';
import 'package:ghhg/features/contracts/presentation/views/contractsearchdialog.dart';
import 'package:ghhg/features/contracts/presentation/views/customtablecontacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class desktopcontracts extends StatelessWidget {
  final TextEditingController tenantname;
  final TextEditingController tenanphone;
  final TextEditingController tenantcard;
  final TextEditingController tenantadress;
  final TextEditingController tenantjob;
  final TextEditingController tenantnationality;
  final TextEditingController ownername;
  final TextEditingController ownerphone;
  final TextEditingController ownercard;
  final TextEditingController owneradress;
  final TextEditingController ownerjob;
  final TextEditingController ownernationality;
  final TextEditingController aqaradress;
  final TextEditingController aqaradressdetails;
  final TextEditingController aqarmohafza;
  final TextEditingController aqartype;
  final TextEditingController area;
  final TextEditingController emaranumber;
  final TextEditingController housenumber;
  final TextEditingController totalvalue;
  final TextEditingController insuranceval;
  final TextEditingController commessionvalue;
  final TextEditingController periodofdelay;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  desktopcontracts(
      {super.key,
      required this.tenantname,
      required this.tenanphone,
      required this.tenantcard,
      required this.tenantadress,
      required this.tenantjob,
      required this.tenantnationality,
      required this.ownername,
      required this.ownerphone,
      required this.ownercard,
      required this.owneradress,
      required this.ownerjob,
      required this.ownernationality,
      required this.aqaradress,
      required this.aqaradressdetails,
      required this.aqarmohafza,
      required this.aqartype,
      required this.area,
      required this.emaranumber,
      required this.housenumber,
      required this.totalvalue,
      required this.insuranceval,
      required this.commessionvalue,
      required this.periodofdelay});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Appcolors.maincolor,
          appBar: AppBar(
            leading: BackButton(
              color: Colors.white,
            ),
            title: Text(
              'عقود الايجار',
              style: TextStyle(color: Colors.white, fontSize: 3.5.sp),
            ),
            centerTitle: true,
            backgroundColor: Appcolors.maincolor,
            actions: [
              IconButton(
                  onPressed: () async {
                    BlocProvider.of<contractCubit>(context).queryParameters =
                        null;
                    await BlocProvider.of<contractCubit>(context)
                        .getallcontracts(token: generaltoken, page: 1);
                  },
                  icon: Icon(Icons.refresh, color: Appcolors.whitecolor)),
              contractsearch(),
              SizedBox(
                width: 10,
              )
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addcontract(
                  formkey: formkey,
                  width: MediaQuery.of(context).size.width * 0.27,
                  tenantname: tenantname,
                  tenanphone: tenanphone,
                  tenantcard: tenantcard,
                  tenantadress: tenantadress,
                  tenantjob: tenantjob,
                  tenantnationality: tenantnationality,
                  ownername: ownername,
                  ownerphone: ownerphone,
                  ownercard: ownercard,
                  owneradress: owneradress,
                  ownerjob: ownerjob,
                  ownernationality: ownernationality,
                  aqaradress: aqaradress,
                  aqaradressdetails: aqaradressdetails,
                  aqarmohafza: aqarmohafza,
                  area: area,
                  emaranumber: emaranumber,
                  housenumber: housenumber,
                  totalvalue: totalvalue,
                  insuranceval: insuranceval,
                  commessionvalue: commessionvalue,
                ),
                customtablecontracts(
                    (MediaQuery.of(context).size.width * 0.70)),
              ],
            ),
          )),
    );
  }
}
