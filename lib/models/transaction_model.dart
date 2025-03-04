import 'package:bank_sha/models/payment_method_model.dart';
import 'package:bank_sha/models/transaction_type_model.dart';

class TransactionModel {
  final int? id;
  final int? amount;
  final DateTime? createdAt;
  final PaymentMethodModel? paymentMethod;
  final TransactionTypeModel? transactionType;

  TransactionModel(
      {this.id,
      this.amount,
      this.createdAt,
      this.paymentMethod,
      this.transactionType});

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
          id: json['id'],
          amount: json['amount'],
          createdAt: DateTime.tryParse(json['created_at']),
          paymentMethod: json['payment_method'] == null
              ? null
              : PaymentMethodModel.fromJson(json['payment_method']),
          transactionType: json['transaction_type'] == null
              ? null
              : TransactionTypeModel.fromJson(json['transaction_type']));
}

// "id": 15,
// "amount": 1000000,
// "created_at": "2021-09-06 09:09:59",
// "payment_method": {
//     "id": 2,
//     "name": "Bank BNI",
//     "code": "bni_va",
//     "thumbnail": ""
// },
// "transaction_type": {
//     "id": 3,
//     "code": "top_up",
//     "name": "Top Up",
//     "action": "cr",
//     "thumbnail": ""
