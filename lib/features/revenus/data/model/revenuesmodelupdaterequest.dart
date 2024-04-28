class revenuesmodelupdaterequest {
  final String amount;
  final String description;
  final String adress;
  final String tenantname;
  final String ownername;
  final String date;

  revenuesmodelupdaterequest(
      {required this.amount,
      required this.description,
      required this.adress,
      required this.tenantname,
      required this.ownername,
      required this.date});

  tojson() => {
        "total_money": this.amount,
        "description": this.description,
        "transaction_date": this.date,
        "real_state_address": this.adress,
        "owner_name": this.ownername,
        "tenant_name": this.tenantname
      };
}
