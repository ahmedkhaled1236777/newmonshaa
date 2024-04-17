import 'package:ghhg/features/contracts/presentation/views/desktopcontracts.dart';
import 'package:ghhg/features/contracts/presentation/views/mobilecontract.dart';

import 'package:flutter/material.dart';

class Contract extends StatefulWidget {
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
  Contract(
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
  State<StatefulWidget> createState() {
    return ContractState();
  }
}

class ContractState extends State<Contract> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  var date1 = 'الايجار من';
  var date2 = 'الايجار الي';
  var date3 = 'التاريخ';
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth > 950)
        return desktopcontracts(
            tenantname: widget.tenantname,
            tenanphone: widget.tenanphone,
            tenantcard: widget.tenantcard,
            tenantadress: widget.tenantadress,
            tenantjob: widget.tenantjob,
            tenantnationality: widget.tenantnationality,
            ownername: widget.ownername,
            ownerphone: widget.ownerphone,
            ownercard: widget.ownercard,
            owneradress: widget.owneradress,
            ownerjob: widget.ownerjob,
            ownernationality: widget.ownernationality,
            aqaradress: widget.aqaradress,
            aqaradressdetails: widget.aqaradressdetails,
            aqarmohafza: widget.aqarmohafza,
            aqartype: widget.aqartype,
            area: widget.area,
            emaranumber: widget.emaranumber,
            housenumber: widget.housenumber,
            totalvalue: widget.totalvalue,
            insuranceval: widget.insuranceval,
            commessionvalue: widget.commessionvalue,
            periodofdelay: widget.periodofdelay);
      else {
        return mobilecontracts(
            tenantname: widget.tenantname,
            tenanphone: widget.tenanphone,
            tenantcard: widget.tenantcard,
            tenantadress: widget.tenantadress,
            tenantjob: widget.tenantjob,
            tenantnationality: widget.tenantnationality,
            ownername: widget.ownername,
            ownerphone: widget.ownerphone,
            ownercard: widget.ownercard,
            owneradress: widget.owneradress,
            ownerjob: widget.ownerjob,
            ownernationality: widget.ownernationality,
            aqaradress: widget.aqaradress,
            aqaradressdetails: widget.aqaradressdetails,
            aqarmohafza: widget.aqarmohafza,
            aqartype: widget.aqartype,
            area: widget.area,
            emaranumber: widget.emaranumber,
            housenumber: widget.housenumber,
            totalvalue: widget.totalvalue,
            insuranceval: widget.insuranceval,
            commessionvalue: widget.commessionvalue,
            periodofdelay: widget.periodofdelay);
      }
    });
  }
}
