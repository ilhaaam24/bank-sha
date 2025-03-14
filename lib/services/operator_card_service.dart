import 'dart:convert';
import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/services/auth_services.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class OperatorCardService {
  Future<List<OperatorCardModel>> getOperatorCards() async {
    try {
      final token = await AuthServices().getToken();

      final res = await http.get(Uri.parse('$baseUrl/operator_cards'),
          headers: {'Authorization': token});

      if (res.statusCode == 200) {
        return List<OperatorCardModel>.from(jsonDecode(res.body)['data'].map(
                (operatorCard) => OperatorCardModel.fromJson(operatorCard)))
            .toList();
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  // Future<List<DataPlanModel>> getDataPlan(
  //     OperatorCardModel operatorCard) async {
  //   try {} catch (e) {
  //     rethrow;
  //   }
  // }
}
