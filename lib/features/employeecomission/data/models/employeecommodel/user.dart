import 'package:equatable/equatable.dart';

class User extends Equatable {
  final num? id;
  final String? name;

  const User({this.id, this.name});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: num.tryParse(json['id'].toString()),
        name: json['name']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
      };

  @override
  List<Object?> get props => [id, name];
}
