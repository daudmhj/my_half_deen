import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tb_mhd/models/ustadz.dart';
import 'package:http/http.dart' as http;

Future<List<Ustadz>> fetchUstadz(http.Client client) async {
  final response = await client.get('http://192.168.43.197:5000/ustadz');
  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parseData, response.body);
}

// A function that will convert a response body into a List<Country>
List<Ustadz> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  List<Ustadz> list =
      parsed.map<Ustadz>((json) => new Ustadz.fromJson(json)).toList();
  return list;
}
