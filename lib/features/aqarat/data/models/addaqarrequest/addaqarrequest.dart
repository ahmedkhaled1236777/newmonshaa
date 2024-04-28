import 'package:dio/dio.dart';

class addaqarrequest {
  final String building_number;
  final String apartment_number;
  dynamic? real_state_images;
  final String real_state_address;
  final String real_state_address_details;
  final String real_state_type;
  final String department;
  final String advertiser_type;
  final String advertised_phone_number;
  final String real_state_space;
  final String real_state_price;
  final String? number_of_bathrooms;
  final int number_of_rooms;
  final String advertise_details;
  final String advertiser_name;
  final String state_date_register;

  addaqarrequest(
      {required this.real_state_address,
      required this.advertiser_name,
      required this.real_state_address_details,
      required this.real_state_type,
      required this.department,
      required this.advertiser_type,
      required this.advertised_phone_number,
      required this.real_state_space,
      required this.real_state_price,
      this.number_of_bathrooms,
      required this.number_of_rooms,
      required this.state_date_register,
      required this.advertise_details,
      required this.apartment_number,
      required this.building_number,
      this.real_state_images});
  FormData tojson() => FormData.fromMap({
        "real_state_images[]": real_state_images,
        "building_number": building_number,
        "advertiser_name": advertiser_name,
        "apartment_number": apartment_number,
        "real_state_address": real_state_address,
        "real_state_address_details": real_state_address_details,
        "real_state_type": real_state_type,
        "department": department,
        "advertiser_type": advertiser_type,
        "advertised_phone_number": advertised_phone_number,
        "real_state_space": real_state_space,
        "real_state_price": real_state_price,
        "number_of_bathrooms": number_of_bathrooms,
        "number_of_rooms": number_of_rooms,
        "advertise_details": advertise_details,
        "state_date_register": state_date_register,
      });
}
