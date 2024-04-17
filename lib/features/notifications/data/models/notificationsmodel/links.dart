import 'package:equatable/equatable.dart';

class Links extends Equatable {
  final String? first;
  final String? last;
  final dynamic prev;
  final String? next;

  const Links({this.first, this.last, this.prev, this.next});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json['first']?.toString(),
        last: json['last']?.toString(),
        prev: json['prev'],
        next: json['next']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (first != null) 'first': first,
        if (last != null) 'last': last,
        if (prev != null) 'prev': prev,
        if (next != null) 'next': next,
      };

  @override
  List<Object?> get props => [first, last, prev, next];
}
