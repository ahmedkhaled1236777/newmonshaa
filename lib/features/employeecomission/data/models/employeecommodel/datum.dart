import 'package:equatable/equatable.dart';

import 'employee.dart';
import 'user.dart';

class Datum extends Equatable {
  final num? id;
  final User? user;
  final Employee? employee;
  final num? totalMoney;
  final String? description;
  final String? realStateAddress;
  final String? ownerName;
  final String? transactionDate;

  const Datum({
    this.id,
    this.user,
    this.employee,
    this.totalMoney,
    this.description,
    this.realStateAddress,
    this.ownerName,
    this.transactionDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: num.tryParse(json['id'].toString()),
        user: json['user'] == null
            ? null
            : User.fromJson(Map<String, dynamic>.from(json['user'])),
        employee: json['employee'] == null
            ? null
            : Employee.fromJson(Map<String, dynamic>.from(json['employee'])),
        totalMoney: num.tryParse(json['total_money'].toString()),
        description: json['description']?.toString(),
        realStateAddress: json['real_state_address']?.toString(),
        ownerName: json['owner_name']?.toString(),
        transactionDate: json['transaction_date']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (user != null) 'user': user?.toJson(),
        if (employee != null) 'employee': employee?.toJson(),
        if (totalMoney != null) 'total_money': totalMoney,
        if (description != null) 'description': description,
        if (realStateAddress != null) 'real_state_address': realStateAddress,
        if (ownerName != null) 'owner_name': ownerName,
        if (transactionDate != null) 'transaction_date': transactionDate,
      };

  @override
  List<Object?> get props {
    return [
      id,
      user,
      employee,
      totalMoney,
      description,
      realStateAddress,
      ownerName,
      transactionDate,
    ];
  }
}
