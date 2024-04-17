import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? name;
  final String? phone;

  const User({this.name, this.phone});

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name']?.toString(),
        phone: json['phone']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (phone != null) 'phone': phone,
      };

  @override
  List<Object?> get props => [name, phone];
}
