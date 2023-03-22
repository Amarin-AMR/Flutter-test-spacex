import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rocketapi/model/list_response.dart';

String url = 'https://api.spacexdata.com/v4/launches/';

Future<RocketListResponse> fetchRocketList() async {
  final response =
      await http.get(Uri.parse('https://api.spacexdata.com/v4/launches/'));
  if (response.statusCode == 200) {
    return RocketListResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load api');
  }
}
