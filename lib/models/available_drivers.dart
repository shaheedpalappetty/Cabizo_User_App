class AvailableDrivers {
  int id;
  String name;
  String lastName;
  String phoneNumber;
  String email;
  String birthDate;
  String driverImg;
  String gender;
  String experience;
  String status;
  String vehicleBrand;
  String vehicleModel;
  String vehicleType;
  String vehicleYear;
  String vehicleColor;
  String vehicleSeat;
  String vehicleNumber;
  int fare;

  AvailableDrivers({
    required this.id,
    required this.name,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.birthDate,
    required this.driverImg,
    required this.gender,
    required this.experience,
    required this.status,
    required this.vehicleBrand,
    required this.vehicleModel,
    required this.vehicleType,
    required this.vehicleYear,
    required this.vehicleColor,
    required this.vehicleSeat,
    required this.vehicleNumber,
    required this.fare,
  });

  factory AvailableDrivers.fromJson(Map<String, dynamic> json) {
    return AvailableDrivers(
      id: json['ID'],
      name: json['Name'],
      lastName: json['LastName'],
      phoneNumber: json['PhoneNumber'],
      email: json['Email'],
      birthDate: json['BirthDate'],
      driverImg: json['DriverImg'],
      gender: json['Gender'],
      experience: json['Experience'],
      status: json['Status'],
      vehicleBrand: json['VehicleBrand'],
      vehicleModel: json['VehicleModel'],
      vehicleType: json['VehicleType'],
      vehicleYear: json['VehicleYear'],
      vehicleColor: json['VehicleColor'],
      vehicleSeat: json['VehicleSeat'],
      vehicleNumber: json['VehicleNumber'],
      fare: json['Fare'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'Name': name,
      'LastName': lastName,
      'PhoneNumber': phoneNumber,
      'Email': email,
      'BirthDate': birthDate,
      'DriverImg': driverImg,
      'Gender': gender,
      'Experience': experience,
      'Status': status,
      'VehicleBrand': vehicleBrand,
      'VehicleModel': vehicleModel,
      'VehicleType': vehicleType,
      'VehicleYear': vehicleYear,
      'VehicleColor': vehicleColor,
      'VehicleSeat': vehicleSeat,
      'VehicleNumber': vehicleNumber,
      'Fare': fare,
    };
  }
}
