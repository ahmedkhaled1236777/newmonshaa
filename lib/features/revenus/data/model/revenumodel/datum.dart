import 'package:equatable/equatable.dart';

import 'user.dart';

class Datum extends Equatable {
  final num? id;
  final num? totalMoney;
  final User? user;
  final String? description;
  final String? transactionDate;
  final String? createdAt;
  final String? updatedAt;

  const Datum({
    this.id,
    this.totalMoney,
    this.user,
    this.description,
    this.transactionDate,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: num.tryParse(json['id'].toString()),
        totalMoney: num.tryParse(json['total_money'].toString()),
        user: json['user'] == null
            ? null
            : User.fromJson(Map<String, dynamic>.from(json['user'])),
        description: json['description']?.toString(),
        transactionDate: json['transaction_date']?.toString(),
        createdAt: json['created_at']?.toString(),
        updatedAt: json['updated_at']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (totalMoney != null) 'total_money': totalMoney,
        if (user != null) 'user': user?.toJson(),
        if (description != null) 'description': description,
        if (transactionDate != null) 'transaction_date': transactionDate,
        if (createdAt != null) 'created_at': createdAt,
        if (updatedAt != null) 'updated_at': updatedAt,
      };

  @override
  List<Object?> get props {
    return [
      id,
      totalMoney,
      user,
      description,
      transactionDate,
      createdAt,
      updatedAt,
    ];
  }
}
