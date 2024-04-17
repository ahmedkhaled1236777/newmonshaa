import 'package:equatable/equatable.dart';

import 'datum.dart';
import 'links.dart';
import 'meta.dart';

class Data extends Equatable {
  final List<Datum>? data;
  final Links? links;
  final Meta? meta;

  const Data({this.data, this.links, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        links: json['links'] == null
            ? null
            : Links.fromJson(Map<String, dynamic>.from(json['links'])),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(Map<String, dynamic>.from(json['meta'])),
      );

  Map<String, dynamic> toJson() => {
        if (data != null) 'data': data?.map((e) => e.toJson()).toList(),
        if (links != null) 'links': links?.toJson(),
        if (meta != null) 'meta': meta?.toJson(),
      };

  @override
  List<Object?> get props => [data, links, meta];
}
