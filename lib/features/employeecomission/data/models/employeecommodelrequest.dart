class employeecommodelrequest{
  final int employeeid;
  final String date;
  final String totalmoney;
  final String desc;
  final String adress;
  final String tenantname;
  final String ownername;

  employeecommodelrequest({required this.employeeid, required this.date, required this.totalmoney, required this.desc, required this.adress, required this.tenantname, required this.ownername});
tojson()=>{
  "employee_id":this.employeeid,
  "total_money":this.totalmoney,
  "description":this.desc,
  "real_state_address":this.adress,
  "tenant_name":this.tenantname,
  "owner_name":this.ownername,
  "transaction_date":this.date
};


}