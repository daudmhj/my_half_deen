import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tb_mhd/models/article.dart';
import 'package:http/http.dart' as http;

Future<List<Articles>> fetchArticle(http.Client client, String param) async {
  final response = await client.get('http://192.168.43.197:5000/articles/'+param);
  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parseData, response.body);
}

// A function that will convert a response body into a List<Country>
List<Articles> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  List<Articles> list =
      parsed.map<Articles>((json) => new Articles.fromJson(json)).toList();
  return list;
}
