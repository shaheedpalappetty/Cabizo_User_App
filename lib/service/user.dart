class User {
  int? id;
  String fullname;
  String birthdate;
  String email;
  String password;
  String phonenumber;
  String gender;
  String image;

  User({
    this.id,
    required this.fullname,
    required this.birthdate,
    required this.email,
    required this.password,
    required this.phonenumber,
    required this.gender,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      fullname: json['fullname'] as String,
      birthdate: json['birthdate'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phonenumber: json['phonenumber'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'birthdate': birthdate,
      'email': email,
      'password': password,
      'phonenumber': phonenumber,
      'gender': gender,
      'image': image,
    };
  }
}

