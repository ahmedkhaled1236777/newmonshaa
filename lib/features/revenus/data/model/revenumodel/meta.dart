import 'package:equatable/equatable.dart';

import 'link.dart';

class Meta extends Equatable {
  final num? currentPage;
  final num? from;
  final num? lastPage;
  final List<Link>? links;
  final String? path;
  final num? perPage;
  final num? to;
  final num? total;

  const Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: num.tryParse(json['current_page'].toString()),
        from: num.tryParse(json['from'].toString()),
        lastPage: num.tryParse(json['last_page'].toString()),
        links: (json['links'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        path: json['path']?.toString(),
        perPage: num.tryParse(json['per_page'].toString()),
        to: num.tryParse(json['to'].toString()),
        total: num.tryParse(json['total'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (currentPage != null) 'current_page': currentPage,
        if (from != null) 'from': from,
        if (lastPage != null) 'last_page': lastPage,
        if (links != null) 'links': links?.map((e) => e.toJson()).toList(),
        if (path != null) 'path': path,
        if (perPage != null) 'per_page': perPage,
        if (to != null) 'to': to,
        if (total != null) 'total': total,
      };

  @override
  List<Object?> get props {
    return [
      currentPage,
      from,
      lastPage,
      links,
      path,
      perPage,
      to,
      total,
    ];
  }
}
