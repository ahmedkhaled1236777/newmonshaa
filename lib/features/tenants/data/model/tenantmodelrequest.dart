class tenentmodelrequest {
  final String name;
  final String cardnumber;
  final String phone;
  final String adress;
  final String job;
  final String nationality;

  tenentmodelrequest(
      {required this.name,
      required this.cardnumber,
      required this.phone,
      required this.adress,
      required this.job,
      required this.nationality});

  tojson() => {
        "name": name,
        "phone": phone,
        "card_number": cardnumber,
        "card_address": adress,
        "job_title": job,
        "nationality": nationality
      };
}
