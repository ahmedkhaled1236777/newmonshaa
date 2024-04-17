import 'package:equatable/equatable.dart';

class Home extends Equatable {
  final String? key;
  final String? name;
  final String? icon;
  final num? count;

  const Home({this.key, this.name, this.icon, this.count});

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        key: json['key']?.toString(),
        name: json['name']?.toString(),
        icon: json['icon']?.toString(),
        count: num.tryParse(json['count'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (key != null) 'key': key,
        if (name != null) 'name': name,
        if (icon != null) 'icon': icon,
        if (count != null) 'count': count,
      };

  @override
  List<Object?> get props => [key, name, icon, count];
}
