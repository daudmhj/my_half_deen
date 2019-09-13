import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:tb_mhd/models/profile.dart';
import 'package:http/http.dart' as http;

import 'package:tb_mhd/models/chat.dart';
import 'package:flutter/services.dart';

class ApiService {

  final String baseUrl = "http://192.168.43.197:5000";

  Future<bool> createProfile(String id) async {
    var response = await http.post(
      "$baseUrl/create/user",
      body: {
        'id': '${id}',
        'nama': '${id}',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfile(Profile data) async {
    var response = await http.post(
      '$baseUrl/update/user',
      body: {
        'id': '${data.id}',
        'nama': '${data.nama}',
        'alamat': '${data.alamat}',
        'email': '${data.email}',
        'telepon': '${data.telepon}',
        'image': '${data.image}',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createChat(Chat data) async {
    var response = await http.post(
      '$baseUrl/create/chat',
      body: {
        'id': '${data.id}',
        'tanggal': '${data.tanggal}',
        'node': '${data.node}',
        'pengirim': '${data.pengirim}',
        'penerima': '${data.penerima}',
        'konten': '${data.konten}',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

}
