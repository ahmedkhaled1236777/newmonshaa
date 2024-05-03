import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final num? id;
  final String? employee;
  final num? code;
  final String? name;
  final String? department;
  final String? phone;
  final String? inspectionDate;
  final String? inspectionTime;
  final String? notes;
  final String? clientType;
  final String? status;

  const Datum({
    this.id,
    this.employee,
    this.code,
    this.name,
    this.department,
    this.phone,
    this.inspectionDate,
    this.inspectionTime,
    this.notes,
    this.clientType,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: num.tryParse(json['id'].toString()),
        employee: json['employee']?.toString(),
        code: num.tryParse(json['code'].toString()),
        name: json['name']?.toString(),
        department: json['department']?.toString(),
        phone: json['phone']?.toString(),
        inspectionDate: json['inspection_date']?.toString(),
        inspectionTime: json['inspection_time']?.toString(),
        notes: json['notes']?.toString(),
        clientType: json['client_type']?.toString(),
        status: json['status']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (employee != null) 'employee': employee,
        if (code != null) 'code': code,
        if (name != null) 'name': name,
        if (department != null) 'department': department,
        if (phone != null) 'phone': phone,
        if (inspectionDate != null) 'inspection_date': inspectionDate,
        if (inspectionTime != null) 'inspection_time': inspectionTime,
        if (notes != null) 'notes': notes,
        if (clientType != null) 'client_type': clientType,
        if (status != null) 'status': status,
      };

  @override
  List<Object?> get props {
    return [
      id,
      employee,
      code,
      name,
      department,
      phone,
      inspectionDate,
      inspectionTime,
      notes,
      clientType,
      status,
    ];
  }
}
