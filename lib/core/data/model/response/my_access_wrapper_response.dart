import 'my_access_response.dart';

class MyAccessWrapperResponse {
  MyAccessWrapperResponse({
    required this.response,
  });

  MyAccessWrapperResponse.fromJson(dynamic json) {
    response = json['response'] != null
        ? MyAccessResponse.fromJson(json['response'])
        : null;
  }

  static  MyAccessWrapperResponse defaultValue = MyAccessWrapperResponse(
    response: MyAccessResponse(
      status: '',
      message: '',
      data: null,
    ),
  );

  MyAccessResponse? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.toJson();
    }
    return map;
  }
}
