import 'package:equatable/equatable.dart';

class State extends Equatable {
  final String? realStateType;
  final num? space;
  final String? addressDetails;
  final String? buildingNumber;
  final String? apartmentNumber;
  final num? contractTotal;
  final num? insuranceTotal;

  const State({
    this.realStateType,
    this.space,
    this.addressDetails,
    this.buildingNumber,
    this.apartmentNumber,
    this.contractTotal,
    this.insuranceTotal,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        realStateType: json['real_state_type']?.toString(),
        space: num.tryParse(json['space'].toString()),
        addressDetails: json['address_details']?.toString(),
        buildingNumber: json['building_number']?.toString(),
        apartmentNumber: json['apartment_number']?.toString(),
        contractTotal: num.tryParse(json['contract_total'].toString()),
        insuranceTotal: num.tryParse(json['insurance_total'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (realStateType != null) 'real_state_type': realStateType,
        if (space != null) 'space': space,
        if (addressDetails != null) 'address_details': addressDetails,
        if (buildingNumber != null) 'building_number': buildingNumber,
        if (apartmentNumber != null) 'apartment_number': apartmentNumber,
        if (contractTotal != null) 'contract_total': contractTotal,
        if (insuranceTotal != null) 'insurance_total': insuranceTotal,
      };

  @override
  List<Object?> get props {
    return [
      realStateType,
      space,
      addressDetails,
      buildingNumber,
      apartmentNumber,
      contractTotal,
      insuranceTotal,
    ];
  }
}
