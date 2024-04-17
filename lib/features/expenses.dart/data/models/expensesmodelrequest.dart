class expensesmodelrequest {
  final String amount;
  final String description;
  final String date;
  final String type;

  expensesmodelrequest(
      {required this.amount,
      required this.description,
      required this.date,
      required this.type});
  tojson() => {
        "total_money": this.amount,
        "description": this.description,
        "transaction_date": this.date,
        "type": this.type
      };
}
