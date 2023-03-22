import 'package:rocketapi/model/list_model.dart';

class RocketListResponse {
  final List<ListModel>? result;

  RocketListResponse({this.result});

  factory RocketListResponse.fromJson(json) => RocketListResponse(
        result: List<Map<String, dynamic>>.from(json as List)
            .map((itemJson) => ListModel.fromJson(itemJson))
            .toList(),
      );
}
