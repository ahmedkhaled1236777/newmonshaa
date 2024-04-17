import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final num? id;
  final String? title;
  final String? body;

  const Datum({this.id, this.title, this.body});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: num.tryParse(json['id'].toString()),
        title: json['title']?.toString(),
        body: json['body']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (title != null) 'title': title,
        if (body != null) 'body': body,
      };

  @override
  List<Object?> get props => [id, title, body];
}
