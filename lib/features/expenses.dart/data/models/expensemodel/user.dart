import 'package:equatable/equatable.dart';

class User extends Equatable {
  final num? id;
  final String? name;
  final String? phone;

  const User({this.id, this.name, this.phone});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: num.tryParse(json['id'].toString()),
        name: json['name']?.toString(),
        phone: json['phone']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (phone != null) 'phone': phone,
      };

  @override
  List<Object?> get props => [id, name, phone];
}
