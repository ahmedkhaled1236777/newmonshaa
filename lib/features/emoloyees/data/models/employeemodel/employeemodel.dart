import 'package:equatable/equatable.dart';

import 'datum.dart';

class Employeemodel extends Equatable {
  final List<Datum>? data;
  final num? code;
  final String? message;
  final bool? status;

  const Employeemodel({this.data, this.code, this.message, this.status});

  factory Employeemodel.fromJson(Map<String, dynamic> json) => Employeemodel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        code: num.tryParse(json['code'].toString()),
        message: json['message']?.toString(),
        status: json['status']?.toString().contains("true"),
      );

  Map<String, dynamic> toJson() => {
        if (data != null) 'data': data?.map((e) => e.toJson()).toList(),
        if (code != null) 'code': code,
        if (message != null) 'message': message,
        if (status != null) 'status': status,
      };

  @override
  List<Object?> get props => [data, code, message, status];
}
