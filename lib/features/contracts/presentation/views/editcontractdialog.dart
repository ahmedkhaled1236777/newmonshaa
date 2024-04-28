import 'package:ghhg/features/contracts/presentation/views/addcontract.dart';
import 'package:flutter/material.dart';

class editcontractdialog extends StatefulWidget {
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
  final TextEditingController area;
  final TextEditingController emaranumber;
  final TextEditingController housenumber;
  final TextEditingController totalvalue;
  final TextEditingController insuranceval;
  final TextEditingController commessionvalue;
  final TextEditingController periodofdelay;

  const editcontractdialog(
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
      required this.area,
      required this.emaranumber,
      required this.housenumber,
      required this.totalvalue,
      required this.insuranceval,
      required this.commessionvalue,
      required this.periodofdelay});

  @override
  State<editcontractdialog> createState() => _editcontractdialogState(
      aqaradress: aqaradress,
      aqaradressdetails: aqaradressdetails,
      aqarmohafza: aqarmohafza,
      area: area,
      emaranumber: emaranumber,
      housenumber: housenumber,
      insuranceval: insuranceval,
      commessionvalue: commessionvalue,
      periodofdelay: periodofdelay,
      tenanphone: tenanphone,
      tenantadress: tenantadress,
      tenantname: tenantname,
      tenantcard: tenantcard,
      tenantjob: tenantjob,
      tenantnationality: tenantnationality,
      totalvalue: totalvalue,
      owneradress: owneradress,
      ownercard: ownercard,
      ownerjob: ownerjob,
      ownername: ownername,
      ownernationality: ownernationality,
      ownerphone: ownerphone);
}

class _editcontractdialogState extends State<editcontractdialog> {
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
  final TextEditingController area;
  final TextEditingController emaranumber;
  final TextEditingController housenumber;
  final TextEditingController totalvalue;
  final TextEditingController insuranceval;
  final TextEditingController commessionvalue;
  final TextEditingController periodofdelay;
  static final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  _editcontractdialogState(
      {required this.tenantname,
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
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: addcontract(
            is_edit: true,
            formkey: formkey,
            width: MediaQuery.sizeOf(context).width > 950
                ? MediaQuery.sizeOf(context).width * 0.25
                : MediaQuery.sizeOf(context).width * 1,
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
        ),
      ),
    );
  }
}
