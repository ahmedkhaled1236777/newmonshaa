class clientmodelrequest {
  final String name;
  final String phone;
  final String code;
  final String departement;
  final String inspectiondate;
  final String inspectiontimedate;
  final String notes;
  final String status;
  final String client_type;

  clientmodelrequest(
      {required this.name,
      required this.phone,
      required this.inspectiontimedate,
      required this.code,
      required this.client_type,
      required this.departement,
      required this.inspectiondate,
      required this.notes,
      required this.status});
  tojson() => {
        "name": this.name,
        "client_type":client_type,
        "phone": this.phone,
        "notes": this.notes,
        "code": this.code,
        "department": this.departement,
        "inspection_date": this.inspectiondate,
        "inspection_time": this.inspectiontimedate,
        "status": this.status,
      };
}
