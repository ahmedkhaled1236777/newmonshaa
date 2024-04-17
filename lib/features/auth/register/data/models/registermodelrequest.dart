class registerrequest {
  final String name;
  final String company_name;
  final String company_address;
  final String password;
  final String company_phone;
  final String phone;
  final String privacy_and_policy;
  String? tax_number;

  registerrequest(
      {required this.name,
      required this.company_name,
      required this.phone,
      required this.company_address,
      required this.password,
      required this.company_phone,
      required this.privacy_and_policy,
      this.tax_number});
  Map<String, dynamic> tojson() => {
        "name": name,
        "phone": phone,
        "company_name": company_name,
        "company_address": company_address,
        "password": password,
        "company_phone": company_phone,
        "privacy_and_policy": privacy_and_policy,
        " tax_number": tax_number,
      };
}
