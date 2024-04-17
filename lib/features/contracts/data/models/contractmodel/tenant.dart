import 'package:equatable/equatable.dart';

class Tenant extends Equatable {
  final num? id;
  final String? name;
  final String? phone;
  final String? cardNumber;
  final String? cardAddress;
  final String? jobTitle;
  final String? nationality;
  final String? createdAt;
  final String? updatedAt;

  const Tenant({
    this.id,
    this.name,
    this.phone,
    this.cardNumber,
    this.cardAddress,
    this.jobTitle,
    this.nationality,
    this.createdAt,
    this.updatedAt,
  });

  factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
        id: num.tryParse(json['id'].toString()),
        name: json['name']?.toString(),
        phone: json['phone']?.toString(),
        cardNumber: json['card_number']?.toString(),
        cardAddress: json['card_address']?.toString(),
        jobTitle: json['job_title']?.toString(),
        nationality: json['nationality']?.toString(),
        createdAt: json['created_at']?.toString(),
        updatedAt: json['updated_at']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (phone != null) 'phone': phone,
        if (cardNumber != null) 'card_number': cardNumber,
        if (cardAddress != null) 'card_address': cardAddress,
        if (jobTitle != null) 'job_title': jobTitle,
        if (nationality != null) 'nationality': nationality,
        if (createdAt != null) 'created_at': createdAt,
        if (updatedAt != null) 'updated_at': updatedAt,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      phone,
      cardNumber,
      cardAddress,
      jobTitle,
      nationality,
      createdAt,
      updatedAt,
    ];
  }
}
