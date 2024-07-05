import 'package:equatable/equatable.dart';

import 'tenant.dart';

class Datum extends Equatable {
  final num? id;
  final String?day;
  final Tenant? tenant;
  final String? ownerName;
  final String? ownerPhone;
  final String? ownerCardNumber;
  final String? ownerCardAddress;
  final String? ownerJobTitle;
  final String? ownerNationality;
  final String? realStateAddress;
  final String? governorate;
  final String? realStateType;
  final num? realStateSpace;
  final String? realStateAddressDetails;
  final String? buildingNumber;
  final String? apartmentNumber;
  final String? contractDate;
  final String? contractDateFrom;
  final String? contractDateTo;
  final num? contractTotal;
  final String? commissionType;
  final num? commission;
  final num? insuranceTotal;
  final num? periodOfDelay;
  final String? cashType;

  const Datum({
    this.id,
    this.tenant,
    this.day,
    this.ownerName,
    this.ownerPhone,
    this.ownerCardNumber,
    this.ownerCardAddress,
    this.ownerJobTitle,
    this.ownerNationality,
    this.realStateAddress,
    this.governorate,
    this.realStateType,
    this.realStateSpace,
    this.realStateAddressDetails,
    this.buildingNumber,
    this.apartmentNumber,
    this.contractDate,
    this.contractDateFrom,
    this.contractDateTo,
    this.contractTotal,
    this.commissionType,
    this.commission,
    this.insuranceTotal,
    this.periodOfDelay,
    this.cashType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: num.tryParse(json['id'].toString()),
        tenant: json['tenant'] == null
            ? null
            : Tenant.fromJson(Map<String, dynamic>.from(json['tenant'])),
        ownerName: json['owner_name']?.toString(),
        ownerPhone: json['owner_phone']?.toString(),
        ownerCardNumber: json['owner_card_number']?.toString(),
        ownerCardAddress: json['owner_card_address']?.toString(),
        ownerJobTitle: json['owner_job_title']?.toString(),
        day: json['day']?.toString(),
        ownerNationality: json['owner_nationality']?.toString(),
        realStateAddress: json['real_state_address']?.toString(),
        governorate: json['governorate']?.toString(),
        realStateType: json['real_state_type']?.toString(),
        realStateSpace: num.tryParse(json['real_state_space'].toString()),
        realStateAddressDetails: json['real_state_address_details']?.toString(),
        buildingNumber: json['building_number']?.toString(),
        apartmentNumber: json['apartment_number']?.toString(),
        contractDate: json['contract_date']?.toString(),
        contractDateFrom: json['contract_date_from']?.toString(),
        contractDateTo: json['contract_date_to']?.toString(),
        contractTotal: num.tryParse(json['contract_total'].toString()),
        commissionType: json['commission_type']?.toString(),
        commission: num.tryParse(json['commission'].toString()),
        insuranceTotal: num.tryParse(json['insurance_total'].toString()),
        periodOfDelay: num.tryParse(json['period_of_delay'].toString()),
        cashType: json['cash_type']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (tenant != null) 'tenant': tenant?.toJson(),
        if (ownerName != null) 'owner_name': ownerName,
        if (ownerPhone != null) 'owner_phone': ownerPhone,
        if (ownerCardNumber != null) 'owner_card_number': ownerCardNumber,
        if (ownerCardAddress != null) 'owner_card_address': ownerCardAddress,
        if (ownerJobTitle != null) 'owner_job_title': ownerJobTitle,
        if (ownerNationality != null) 'owner_nationality': ownerNationality,
        if (realStateAddress != null) 'real_state_address': realStateAddress,
        if (governorate != null) 'governorate': governorate,
        if (realStateType != null) 'real_state_type': realStateType,
        if (realStateSpace != null) 'real_state_space': realStateSpace,
        if (realStateAddressDetails != null)
          'real_state_address_details': realStateAddressDetails,
        if (buildingNumber != null) 'building_number': buildingNumber,
        if (apartmentNumber != null) 'apartment_number': apartmentNumber,
        if (contractDate != null) 'contract_date': contractDate,
        if (contractDateFrom != null) 'contract_date_from': contractDateFrom,
        if (contractDateTo != null) 'contract_date_to': contractDateTo,
        if (contractTotal != null) 'contract_total': contractTotal,
        if (commissionType != null) 'commission_type': commissionType,
        if (commission != null) 'commission': commission,
        if (insuranceTotal != null) 'insurance_total': insuranceTotal,
        if (periodOfDelay != null) 'period_of_delay': periodOfDelay,
        if (cashType != null) 'cash_type': cashType,
      };

  @override
  List<Object?> get props {
    return [
      id,
      tenant,
      ownerName,
      ownerPhone,
      ownerCardNumber,
      ownerCardAddress,
      ownerJobTitle,
      ownerNationality,
      realStateAddress,
      governorate,
      realStateType,
      realStateSpace,
      realStateAddressDetails,
      buildingNumber,
      apartmentNumber,
      contractDate,
      contractDateFrom,
      contractDateTo,
      contractTotal,
      commissionType,
      commission,
      insuranceTotal,
      periodOfDelay,
      cashType,
    ];
  }
}
