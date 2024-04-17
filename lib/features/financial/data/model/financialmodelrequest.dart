class financialmodelrequest {
  final String date;
  final String amountofmoney;
  final String datefrom;
  final String dateto;

  financialmodelrequest(
      {required this.date,
      required this.amountofmoney,
      required this.datefrom,
      required this.dateto});

  tojson() => {
        "total_amount": amountofmoney,
        "transaction_date": date,
        "contract_date_from": datefrom,
        "contract_date_to": dateto
      };
}
