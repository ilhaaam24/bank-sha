import 'dart:convert';

import 'package:bank_sha/models/user_edit_form_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/services/auth_services.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.put(Uri.parse('$baseUrl/users'),
          body: data.toJson(), headers: {'authorization': token});
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getRecentUser() async {
    try {
      final token = await AuthServices().getToken();
      final res =
          await http.get(Uri.parse('$baseUrl/transfer_histories'), headers: {
        'Authorization': token,
      });

      if (res.statusCode == 200) {
        return List<UserModel>.from(jsonDecode(res.body)['data']
            .map((user) => UserModel.fromJson(user))).toList();
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getUserByUsername(String username) async {
    try {
      final token = await AuthServices().getToken();
      final res =
          await http.get(Uri.parse('$baseUrl/users/$username'), headers: {
        'Authorization': token,
      });

      if (res.statusCode == 200) {
        return List<UserModel>.from(
                jsonDecode(res.body).map((user) => UserModel.fromJson(user)))
            .toList();
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
