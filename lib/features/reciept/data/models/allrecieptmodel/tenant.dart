import 'package:equatable/equatable.dart';

class Tenant extends Equatable {
  final String? name;
  final String? phone;
  final String? cardNumber;
  final String? cardAddress;
  final String? jobTitle;
  final String? nationality;

  const Tenant({
    this.name,
    this.phone,
    this.cardNumber,
    this.cardAddress,
    this.jobTitle,
    this.nationality,
  });

  factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
        name: json['name']?.toString(),
        phone: json['phone']?.toString(),
        cardNumber: json['card_number']?.toString(),
        cardAddress: json['card_address']?.toString(),
        jobTitle: json['job_title']?.toString(),
        nationality: json['nationality']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (phone != null) 'phone': phone,
        if (cardNumber != null) 'card_number': cardNumber,
        if (cardAddress != null) 'card_address': cardAddress,
        if (jobTitle != null) 'job_title': jobTitle,
        if (nationality != null) 'nationality': nationality,
      };

  @override
  List<Object?> get props {
    return [
      name,
      phone,
      cardNumber,
      cardAddress,
      jobTitle,
      nationality,
    ];
  }
}
