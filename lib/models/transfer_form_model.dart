class TransferFormModel {
  final String? pin;
  final String? amount;
  final String? sendTo;

  TransferFormModel({this.pin, this.amount, this.sendTo});

  TransferFormModel copyWith({
    String? pin,
    String? amount,
    String? sendTo,
  }) =>
      TransferFormModel(
        pin: pin ?? this.pin,
        amount: amount ?? this.amount,
        sendTo: sendTo ?? this.sendTo,
      );
  Map<String, dynamic> toJson() =>
      {'amount': amount, 'pin': pin, 'send_to': sendTo};
}
