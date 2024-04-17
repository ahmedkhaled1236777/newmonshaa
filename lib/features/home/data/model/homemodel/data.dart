import 'package:equatable/equatable.dart';

import 'home.dart';
import 'sidebar.dart';

class Data extends Equatable {
  final num? id;
  final dynamic logo;
  final String? name;
  final String? userType;
  final String? companyName;
  final List<Sidebar>? sidebar;
  final List<Home>? home;

  const Data({
    this.id,
    this.logo,
    this.name,
    this.userType,
    this.companyName,
    this.sidebar,
    this.home,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: num.tryParse(json['id'].toString()),
        logo: json['logo'],
        name: json['name']?.toString(),
        userType: json['user_type']?.toString(),
        companyName: json['company_name']?.toString(),
        sidebar: (json['sidebar'] as List<dynamic>?)
            ?.map((e) => Sidebar.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        home: (json['home'] as List<dynamic>?)
            ?.map((e) => Home.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (logo != null) 'logo': logo,
        if (name != null) 'name': name,
        if (userType != null) 'user_type': userType,
        if (companyName != null) 'company_name': companyName,
        if (sidebar != null)
          'sidebar': sidebar?.map((e) => e.toJson()).toList(),
        if (home != null) 'home': home?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      logo,
      name,
      userType,
      companyName,
      sidebar,
      home,
    ];
  }
}
