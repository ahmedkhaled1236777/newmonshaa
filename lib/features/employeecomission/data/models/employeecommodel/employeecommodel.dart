import 'package:equatable/equatable.dart';

import 'data.dart';

class Employeecommodel extends Equatable {
  final Data? data;
  final num? code;
  final String? message;
  final bool? status;
  final num? total;

  const Employeecommodel({
    this.data,
    this.code,
    this.message,
    this.status,
    this.total,
  });

  factory Employeecommodel.fromJson(Map<String, dynamic> json) {
    return Employeecommodel(
      data: json['data'] == null
          ? null
          : Data.fromJson(Map<String, dynamic>.from(json['data'])),
      code: num.tryParse(json['code'].toString()),
      message: json['message']?.toString(),
      status: json['status']?.toString().contains("true"),
      total: num.tryParse(json['total'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        if (data != null) 'data': data?.toJson(),
        if (code != null) 'code': code,
        if (message != null) 'message': message,
        if (status != null) 'status': status,
        if (total != null) 'total': total,
      };

  @override
  List<Object?> get props => [data, code, message, status, total];
}
