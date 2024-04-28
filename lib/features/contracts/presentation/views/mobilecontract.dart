import 'package:ghhg/core/color/appcolors.dart';
import 'package:ghhg/core/commn/navigation.dart';
import 'package:ghhg/core/sizes/appsizes.dart';
import 'package:ghhg/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:ghhg/features/contracts/presentation/views/addcontractwithscafold.dart';
import 'package:ghhg/features/contracts/presentation/views/contractsearchdialog.dart';
import 'package:ghhg/features/contracts/presentation/views/customtablecontacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/commn/toast.dart';

class mobilecontracts extends StatelessWidget {
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

  mobilecontracts(
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
    return LayoutBuilder(builder: (context, constrains) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Color(0xff415769),
            appBar: AppBar(
              leading: BackButton(
                color: Colors.white,
              ),
              title: Text(
                'عقود الايجار',
                style: TextStyle(
                    color: Colors.white, fontSize: Appsizes.mappBarsize),
              ),
              centerTitle: true,
              backgroundColor: Color(0xff415769),
              actions: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<contractCubit>(context)
                              .queryParameters = null;

                          BlocProvider.of<contractCubit>(context)
                              .getallcontracts(token: generaltoken, page: 1);
                        },
                        icon: const Icon(
                          Icons.refresh,
                          color: Appcolors.whitecolor,
                        )),
                    contractsearch(),
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigateto(
                    navigationscreen: addcontractwithscafold(
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
                        aqartype: aqartype,
                        area: area,
                        emaranumber: emaranumber,
                        housenumber: housenumber,
                        totalvalue: totalvalue,
                        insuranceval: insuranceval,
                        commessionvalue: commessionvalue,
                        periodofdelay: periodofdelay),
                    context: context);
              },
              backgroundColor: Color(0xffBF4F51),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customtablecontracts(MediaQuery.sizeOf(context).width)
              ],
            )),
      );
    });
  }
}
