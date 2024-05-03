class revenuesmodelrequest {
  final String amount;
  final String description;
  final String adress;
  final String ownernamr;
  final String date;
  final String type;

  revenuesmodelrequest(
      {required this.amount,
      required this.description,
      required this.adress,
      required this.ownernamr,
      required this.date,
      required this.type});
  tojson() => {
        "total_money": this.amount,
        "real_state_address": this.adress,
        "owner_name": this.ownernamr,
        "description": this.description,
        "transaction_date": this.date,
        "type": this.type
      };
}
