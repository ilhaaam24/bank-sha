import 'dart:convert';

import 'package:bank_sha/services/auth_services.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class WalletServices {
  Future<void> updatePin(String oldPin, String newPin) async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.put(Uri.parse('$baseUrl/wallets'),
          body: {"previous_pin": oldPin, "new_pin": newPin},
          headers: {'authorization': token});
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
