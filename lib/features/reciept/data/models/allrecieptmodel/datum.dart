import 'package:equatable/equatable.dart';

import 'receipt.dart';

class Datum extends Equatable {
  final num? id;
  final String? tenant;
  final String? ownerName;
  final String? realStateAddress;
  final num? contractTotal;
  final List<Receipt>? receipts;

  const Datum({
    this.id,
    this.tenant,
    this.ownerName,
    this.realStateAddress,
    this.contractTotal,
    this.receipts,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: num.tryParse(json['id'].toString()),
        tenant: json['tenant']?.toString(),
        ownerName: json['owner_name']?.toString(),
        realStateAddress: json['real_state_address']?.toString(),
        contractTotal: num.tryParse(json['contract_total'].toString()),
        receipts: (json['receipts'] as List<dynamic>?)
            ?.map((e) => Receipt.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (tenant != null) 'tenant': tenant,
        if (ownerName != null) 'owner_name': ownerName,
        if (realStateAddress != null) 'real_state_address': realStateAddress,
        if (contractTotal != null) 'contract_total': contractTotal,
        if (receipts != null)
          'receipts': receipts?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      tenant,
      ownerName,
      realStateAddress,
      contractTotal,
      receipts,
    ];
  }
}
