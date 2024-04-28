class connectmodelrequest {
  final String tittle;
  final String messgae;

  connectmodelrequest({required this.tittle, required this.messgae});
  tojson() => {"subject": tittle, "message": messgae};
}
