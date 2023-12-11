import 'status_response.dart';
import 'types_response.dart';

class DropdownOptions {
  DropdownOptions({
    this.status,
    this.types,
  });

  DropdownOptions.fromJson(dynamic json) {
    status =
        json['status'] != null ? StatusResponse.fromJson(json['status']) : null;
    types =
        json['types'] != null ? TypesResponse.fromJson(json['types']) : null;
  }

  StatusResponse? status;
  TypesResponse? types;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (status != null) {
      map['status'] = status?.toJson();
    }
    if (types != null) {
      map['types'] = types?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'DropdownOptions{status: $status, types: $types}';
  }
}
