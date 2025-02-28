class TopupFormModel {
  final String? pin;
  final String? amount;
  final String? paymentMethodCode;

  TopupFormModel({this.pin, this.amount, this.paymentMethodCode});

  TopupFormModel copyWith({
    String? pin,
    String? amount,
    String? paymentMethodCode,
  }) =>
      TopupFormModel(
        pin: pin ?? this.pin,
        amount: amount ?? this.amount,
        paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
      );
  Map<String, dynamic> toJson() =>
      {'amount': amount, 'pin': pin, 'payment_method_code': paymentMethodCode};
}
