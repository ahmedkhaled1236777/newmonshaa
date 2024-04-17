import 'package:equatable/equatable.dart';

class Owner extends Equatable {
  final String? name;
  final String? phone;
  final String? cardNumber;
  final String? address;
  final String? jobTitle;
  final String? nationality;

  const Owner({
    this.name,
    this.phone,
    this.cardNumber,
    this.address,
    this.jobTitle,
    this.nationality,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        name: json['name']?.toString(),
        phone: json['phone']?.toString(),
        cardNumber: json['card_number']?.toString(),
        address: json['address']?.toString(),
        jobTitle: json['job_title']?.toString(),
        nationality: json['nationality']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (phone != null) 'phone': phone,
        if (cardNumber != null) 'card_number': cardNumber,
        if (address != null) 'address': address,
        if (jobTitle != null) 'job_title': jobTitle,
        if (nationality != null) 'nationality': nationality,
      };

  @override
  List<Object?> get props {
    return [
      name,
      phone,
      cardNumber,
      address,
      jobTitle,
      nationality,
    ];
  }
}
