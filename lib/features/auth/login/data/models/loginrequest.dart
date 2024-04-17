class loginrequest {
  final String password;
  final String phone;
  final String token;
  final String device_type;

  loginrequest(
      {required this.password,
      required this.phone,
      required this.device_type,
      required this.token});
  tojson() => {
        "password": password,
        "phone": phone,
        "device_type": this.device_type,
        "token": this.token
      };
}
