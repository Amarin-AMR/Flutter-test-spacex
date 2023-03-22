import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rocketapi/model/list_response.dart';

Future<RocketListResponse> fetchRocketList(String id) async {
  final response = await http.post(
    Uri.parse('https://api.spacexdata.com/v4/crews/query?id=$id'),
  );
  if (response.statusCode == 200) {
    return RocketListResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load api');
  }
}
