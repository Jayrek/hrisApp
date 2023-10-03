import 'personal_region_response.dart';
import 'personal_province_response.dart';
import 'personal_city_response.dart';
import 'personal_barangay_response.dart';

class PersonalAddressResponse {
  PersonalAddressResponse({
    this.region,
    this.province,
    this.city,
    this.barangay,
  });

  PersonalAddressResponse.fromJson(dynamic json) {
    region = json['region'] != null
        ? PersonalRegionResponse.fromJson(json['region'])
        : null;
    province = json['province'] != null
        ? PersonalProvinceResponse.fromJson(json['province'])
        : null;
    city = json['city'] != null
        ? PersonalCityResponse.fromJson(json['city'])
        : null;
    barangay = json['barangay'] != null
        ? PersonalBarangayResponse.fromJson(json['barangay'])
        : null;
  }

  PersonalRegionResponse? region;
  PersonalProvinceResponse? province;
  PersonalCityResponse? city;
  PersonalBarangayResponse? barangay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (region != null) {
      map['region'] = region?.toJson();
    }
    if (province != null) {
      map['province'] = province?.toJson();
    }
    if (city != null) {
      map['city'] = city?.toJson();
    }
    if (barangay != null) {
      map['barangay'] = barangay?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'PersonalAddressResponse{region: $region, province: $province, city: $city, barangay: $barangay}';
  }
}
