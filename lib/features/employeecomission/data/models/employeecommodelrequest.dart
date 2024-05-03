class employeecommodelrequest {
  final int employeeid;
  final String date;
  final String totalmoney;
  final String desc;
  final String adress;
  final String ownername;

  employeecommodelrequest(
      {required this.employeeid,
      required this.date,
      required this.totalmoney,
      required this.desc,
      required this.adress,
      required this.ownername});
  tojson() => {
        "employee_id": this.employeeid,
        "total_money": this.totalmoney,
        "description": this.desc,
        "real_state_address": this.adress,
        "owner_name": this.ownername,
        "transaction_date": this.date
      };
}
