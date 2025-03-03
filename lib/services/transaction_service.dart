import 'dart:convert';
import 'dart:ffi';

import 'package:bank_sha/models/topup_form_model.dart';
import 'package:bank_sha/models/transfer_form_model.dart';
import 'package:bank_sha/services/auth_services.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<String> topUp(TopupFormModel data) async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.post(Uri.parse('$baseUrl/top_ups'),
          headers: {'authorization': token}, body: data.toJson());

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<Void> transfer(TransferFormModel data) async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.post(Uri.parse('$baseUrl/transfers'),
          headers: {'authorization': token}, body: data.toJson());

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
