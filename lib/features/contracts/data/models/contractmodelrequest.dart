class contractmodelrequest {
  final String tenant_name;
  final String tenant_cardnumber;
  final String tenant_phone;
  final String tenant_adress;
  final String tenant_job;
  final String tenant_nationality;
  final String owner_name;
  final String owner_cardnumber;
  final String owner_phone;
  final String owner_adress;
  final String owner_job;
  final String owner_nationality;
  final String aqar_adress;
  final String governrate;
  final String aqar_type;
  final String area;
  final String aqaradressdetails;
  final String emaranumber;
  final String flatnumber;
  final String date;
  final String contractfrom;
  final String contractto;
  final String contractvalue;
  final String commission_type;
  final String commission;
  final String insurance_total;
  final String havemoney;

  contractmodelrequest({
    required this.tenant_name,
    required this.havemoney,
    required this.tenant_cardnumber,
    required this.tenant_phone,
    required this.tenant_adress,
    required this.tenant_job,
    required this.tenant_nationality,
    required this.owner_name,
    required this.owner_cardnumber,
    required this.owner_phone,
    required this.owner_adress,
    required this.owner_job,
    required this.owner_nationality,
    required this.aqar_adress,
    required this.governrate,
    required this.aqar_type,
    required this.area,
    required this.aqaradressdetails,
    required this.emaranumber,
    required this.flatnumber,
    required this.date,
    required this.contractfrom,
    required this.contractto,
    required this.contractvalue,
    required this.commission_type,
    required this.commission,
    required this.insurance_total,
  });

  tojson() => {
        "name": tenant_name,
        "cash_type": havemoney,
        "phone": tenant_phone,
        "card_number": tenant_cardnumber,
        "card_address": tenant_adress,
        "job_title": tenant_job,
        "nationality": tenant_nationality,
        "owner_name": owner_name,
        "owner_phone": owner_phone,
        "owner_card_number": owner_cardnumber,
        "owner_card_address": owner_adress,
        "owner_job_title": owner_job,
        "owner_nationality": owner_nationality,
        "real_state_address": aqar_adress,
        "governorate": governrate,
        "real_state_type": aqar_type,
        "real_state_space": area,
        "real_state_address_details": aqaradressdetails,
        "building_number": flatnumber,
        "apartment_number": emaranumber,
        "contract_date": date,
        "contract_date_from": contractfrom,
        "contract_date_to": contractto,
        "contract_total": contractvalue,
        "commission_type": commission_type,
        "commission": commission,
        "insurance_total": insurance_total,
      };
}
