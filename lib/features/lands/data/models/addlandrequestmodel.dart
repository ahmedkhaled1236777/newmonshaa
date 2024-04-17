import 'package:dio/dio.dart';

class addlandrequest {
  dynamic? land_images;
  final String address;
  final String real_state_address_details;
  final String seller_name;
  final num size_in_metres;
  final num price_of_one_meter;
  final num total_cost;
  final String seller_phone_number;
  final String advertiser_type;
  String? advertise_details;
  final String land_date_register;

  addlandrequest(
      {required this.address,
      required this.real_state_address_details,
      required this.seller_name,
      required this.size_in_metres,
      required this.price_of_one_meter,
      required this.total_cost,
      required this.seller_phone_number,
      required this.advertiser_type,
      required this.land_date_register,
      this.advertise_details,
      this.land_images});

  FormData tojson() => FormData.fromMap({
        "land_images[]": land_images,
        "address": address,
        "seller_name": seller_name,
        "address_details": real_state_address_details,
        "size_in_metres": size_in_metres,
        "price_of_one_meter": price_of_one_meter,
        "total_cost": total_cost,
        "seller_phone_number": seller_phone_number,
        "advertiser_type": advertiser_type,
        "advertiser_type": advertiser_type,
        "advertise_details": advertise_details,
        "land_date_register": land_date_register,
      });
}
