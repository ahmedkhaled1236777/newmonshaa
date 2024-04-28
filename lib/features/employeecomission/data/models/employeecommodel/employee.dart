import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final num? id;
  final String? name;

  const Employee({this.id, this.name});

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
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
