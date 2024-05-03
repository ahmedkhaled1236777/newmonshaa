import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:ghhg/features/contracts/presentation/views/addcontract.dart';
import 'package:flutter/material.dart';

class addcontractwithscafold extends StatelessWidget {
  GlobalKey<FormState> foemkey = GlobalKey<FormState>();
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

  addcontractwithscafold(
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
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              BlocProvider.of<contractCubit>(context).id = null;
              Navigator.pop(context);
            },
            color: Colors.white,
          ),
          backgroundColor: Appcolors.maincolor,
          centerTitle: true,
          title: Text(
            "تسجيل عقد ايجار",
            style:
                TextStyle(color: Colors.white, fontSize: Appsizes.mappBarsize),
          ),
        ),
        body: Center(
            child: addcontract(
          formkey: foemkey,
          width: MediaQuery.of(context).size.width,
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
        )),
      ),
    );
  }
}
