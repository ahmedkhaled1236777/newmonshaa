import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final num? id;
  final String? name;

  const Datum({this.id, this.name});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
