class SignUpFormModel {
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilePicture;
  final String? ktp;

  // Constructor
  SignUpFormModel(
      {this.name,
      this.email,
      this.password,
      this.pin,
      this.profilePicture,
      this.ktp});

  // mengubah file ke dalam bentuk json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'pin': pin,
      'profile_picture': profilePicture,
      'ktp': ktp
    };
  }

  //  mempertahankan data yang lama dan menambahkan data baru yaitu pin, profilePicture, dan ktp
  SignUpFormModel copyWith(
          {String? pin, String? profilePicture, String? ktp}) =>
      SignUpFormModel(
          name: name,
          email: email,
          password: password,
          pin: pin ?? this.pin,
          profilePicture: profilePicture ?? this.profilePicture,
          ktp: ktp ?? this.ktp);
}
