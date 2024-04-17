class expensesmodelupdaterequest {
  final String amount;
  final String description;
  final String date;

  expensesmodelupdaterequest(
      {required this.amount, required this.description, required this.date});
  tojson() => {
        "total_money": this.amount,
        "description": this.description,
        "transaction_date": this.date,
      };
}
