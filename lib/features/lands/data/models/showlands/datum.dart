import 'package:equatable/equatable.dart';

import 'user.dart';

class Datum extends Equatable {
  final num? id;
  final User? user;
  final List<dynamic>? landImages;
  final String? address;
  final String? addressDetails;
  final String? sellerName;
  final num? sizeInMetres;
  final num? priceOfOneMeter;
  final num? totalCost;
  final String? sellerPhoneNumber;
  final String? advertiserType;
  final String? advertiseDetails;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  const Datum({
    this.id,
    this.user,
    this.landImages,
    this.address,
    this.addressDetails,
    this.sellerName,
    this.sizeInMetres,
    this.priceOfOneMeter,
    this.totalCost,
    this.sellerPhoneNumber,
    this.advertiserType,
    this.advertiseDetails,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: num.tryParse(json['id'].toString()),
        user: json['user'] == null
            ? null
            : User.fromJson(Map<String, dynamic>.from(json['user'])),
        landImages: List<dynamic>.from(json['land_images'] ?? []),
        address: json['address']?.toString(),
        addressDetails: json['address_details']?.toString(),
        sellerName: json['seller_name']?.toString(),
        sizeInMetres: num.tryParse(json['size_in_metres'].toString()),
        priceOfOneMeter: num.tryParse(json['price_of_one_meter'].toString()),
        totalCost: num.tryParse(json['total_cost'].toString()),
        sellerPhoneNumber: json['seller_phone_number']?.toString(),
        advertiserType: json['advertiser_type']?.toString(),
        advertiseDetails: json['advertise_details']?.toString(),
        status: json['status']?.toString(),
        createdAt: json['created_at']?.toString(),
        updatedAt: json['updated_at']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (user != null) 'user': user?.toJson(),
        if (landImages != null) 'land_images': landImages,
        if (address != null) 'address': address,
        if (addressDetails != null) 'address_details': addressDetails,
        if (sellerName != null) 'seller_name': sellerName,
        if (sizeInMetres != null) 'size_in_metres': sizeInMetres,
        if (priceOfOneMeter != null) 'price_of_one_meter': priceOfOneMeter,
        if (totalCost != null) 'total_cost': totalCost,
        if (sellerPhoneNumber != null) 'seller_phone_number': sellerPhoneNumber,
        if (advertiserType != null) 'advertiser_type': advertiserType,
        if (advertiseDetails != null) 'advertise_details': advertiseDetails,
        if (status != null) 'status': status,
        if (createdAt != null) 'created_at': createdAt,
        if (updatedAt != null) 'updated_at': updatedAt,
      };

  @override
  List<Object?> get props {
    return [
      id,
      user,
      landImages,
      address,
      addressDetails,
      sellerName,
      sizeInMetres,
      priceOfOneMeter,
      totalCost,
      sellerPhoneNumber,
      advertiserType,
      advertiseDetails,
      status,
      createdAt,
      updatedAt,
    ];
  }
}
