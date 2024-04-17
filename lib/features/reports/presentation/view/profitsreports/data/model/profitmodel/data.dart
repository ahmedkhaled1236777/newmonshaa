import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final num? totalRevenue;
  final num? totalExpense;
  final num? totalProfits;
  final String? date;

  const Data({
    this.totalRevenue,
    this.totalExpense,
    this.totalProfits,
    this.date,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalRevenue: num.tryParse(json['total_revenue'].toString()),
        totalExpense: num.tryParse(json['total_expense'].toString()),
        totalProfits: num.tryParse(json['total_profits'].toString()),
        date: json['date']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (totalRevenue != null) 'total_revenue': totalRevenue,
        if (totalExpense != null) 'total_expense': totalExpense,
        if (totalProfits != null) 'total_profits': totalProfits,
        if (date != null) 'date': date,
      };

  @override
  List<Object?> get props {
    return [
      totalRevenue,
      totalExpense,
      totalProfits,
      date,
    ];
  }
}
