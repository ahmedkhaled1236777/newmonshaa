import 'package:equatable/equatable.dart';

class Link extends Equatable {
  final dynamic url;
  final String? label;
  final bool? active;

  const Link({this.url, this.label, this.active});

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json['url'],
        label: json['label']?.toString(),
        active: json['active']?.toString().contains("true"),
      );

  Map<String, dynamic> toJson() => {
        if (url != null) 'url': url,
        if (label != null) 'label': label,
        if (active != null) 'active': active,
      };

  @override
  List<Object?> get props => [url, label, active];
}
