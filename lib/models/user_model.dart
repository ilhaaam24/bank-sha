class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? username;
  final int? verified;
  final String? profilePicture;
  final int? balance;
  final String? cardNumber;
  final String? pin;
  final String? token;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.username,
      this.verified,
      this.profilePicture,
      this.balance,
      this.cardNumber,
      this.pin,
      this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        username: json['username'],
        verified: json['verified'],
        profilePicture: json['profile_picture'],
        balance: json['balance'],
        cardNumber: json['card_number'],
        pin: json['pin'],
        token: json['token'],
      );

  UserModel copyWith(
          {String? name,
          String? username,
          String? email,
          String? password,
          String? pin,
          int? balance}) =>
      UserModel(
          id: id,
          name: name ?? this.name,
          username: username ?? this.username,
          email: email ?? this.email,
          password: password ?? this.password,
          pin: pin ?? this.pin,
          balance: balance ?? this.balance,
          verified: verified,
          profilePicture: profilePicture,
          cardNumber: cardNumber,
          token: token);
}
