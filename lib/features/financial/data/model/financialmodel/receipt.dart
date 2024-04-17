import 'package:equatable/equatable.dart';

import 'owner.dart';
import 'state.dart';
import 'user.dart';

class Receipt extends Equatable {
  final num? id;
  final User? user;
  final Owner? owner;
  final State? state;
  final String? tenantName;
  final String? tenantPhone;
  final num? totalAmount;
  final String? transactionDate;
  final String? contractDateFrom;
  final String? contractDateTo;

  const Receipt({
    this.id,
    this.user,
    this.owner,
    this.state,
    this.tenantName,
    this.tenantPhone,
    this.totalAmount,
    this.transactionDate,
    this.contractDateFrom,
    this.contractDateTo,
  });

  factory Receipt.fromJson(Map<String, dynamic> json) => Receipt(
        id: num.tryParse(json['id'].toString()),
        user: json['user'] == null
            ? null
            : User.fromJson(Map<String, dynamic>.from(json['user'])),
        owner: json['owner'] == null
            ? null
            : Owner.fromJson(Map<String, dynamic>.from(json['owner'])),
        state: json['state'] == null
            ? null
            : State.fromJson(Map<String, dynamic>.from(json['state'])),
        tenantName: json['tenant_name']?.toString(),
        tenantPhone: json['tenant_phone']?.toString(),
        totalAmount: num.tryParse(json['total_amount'].toString()),
        transactionDate: json['transaction_date']?.toString(),
        contractDateFrom: json['contract_date_from']?.toString(),
        contractDateTo: json['contract_date_to']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (user != null) 'user': user?.toJson(),
        if (owner != null) 'owner': owner?.toJson(),
        if (state != null) 'state': state?.toJson(),
        if (tenantName != null) 'tenant_name': tenantName,
        if (tenantPhone != null) 'tenant_phone': tenantPhone,
        if (totalAmount != null) 'total_amount': totalAmount,
        if (transactionDate != null) 'transaction_date': transactionDate,
        if (contractDateFrom != null) 'contract_date_from': contractDateFrom,
        if (contractDateTo != null) 'contract_date_to': contractDateTo,
      };

  @override
  List<Object?> get props {
    return [
      id,
      user,
      owner,
      state,
      tenantName,
      tenantPhone,
      totalAmount,
      transactionDate,
      contractDateFrom,
      contractDateTo,
    ];
  }
}
